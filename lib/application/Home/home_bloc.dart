import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/Domain/HotAndNew/Models/hotand_new.dart';
import 'package:netflix_ui/Domain/HotAndNew/hot_and_new_service.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotandNewService _homeService;
  
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      log('Getting Data');
      //send loading to ui

      emit(state.copyWith(isLoading: true, isError: false));

      //get data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTVData();
      // transform data

      final state1 = _movieResult.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          SouthIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final pastyear = res.results;
        final trending = res.results;
        final tensed = res.results;
        final southindian = res.results;

        pastyear.shuffle();
        trending.shuffle();
        tensed.shuffle();
        southindian.shuffle();

        return HomeState(
          pastYearMovieList: pastyear,
          trendingMovieList: trending,
          tenseDramaMovieList: tensed,
          SouthIndianMovieList: southindian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });
      emit(state1);

      final state2 = _tvResult.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          SouthIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final top10List = res.results;
        return HomeState(
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          SouthIndianMovieList: state.SouthIndianMovieList,
          trendingTvList: top10List,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });

      //send to ui

      emit(state2);
    });
  }
}
