import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/Domain/HotAndNew/Models/hotand_new.dart';
import 'package:netflix_ui/Domain/HotAndNew/hot_and_new_service.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotandNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    /*
    get coming soon data
    */
    on<LoadDataCmingSoon>((event, emit) async {
      emit(
        HotAndNewState(
          isLoading: true,
          isError: false,
          comingSoonList: [],
          everyOneIsWatchingList: [],
        ),
      );
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();

      //data to state
      final newState =  _result.fold((MainFailure fail) {
        return const HotAndNewState(
          isLoading: false,
          isError: true,
          comingSoonList: [],
          everyOneIsWatchingList: [],
        );
      }, (HotandNew success) {
        return HotAndNewState(
          isLoading: false,
          isError: false,
          comingSoonList: success.results,
          everyOneIsWatchingList: state.everyOneIsWatchingList,
        );
      });
      emit(newState);
    });
    /*
    get everyoneswatching data
    */

    on<LoadDataEvryOneWaching>((event, emit) async {
      emit(
        HotAndNewState(
          isLoading: true,
          isError: false,
          comingSoonList: [],
          everyOneIsWatchingList: [],
        ),
      );
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewTVData();

      //data to state
      final newState =  _result.fold((MainFailure fail) {
        return const HotAndNewState(
          isLoading: false,
          isError: true,
          comingSoonList: [],
          everyOneIsWatchingList: [],
        );
      }, (HotandNew success) {
        return HotAndNewState(
          isLoading: false,
          isError: false,
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: success.results,
        );
      });
      emit(newState);
    });
  }
}
