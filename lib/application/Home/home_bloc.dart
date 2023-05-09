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
      final _southIndian = await _homeService.getSouthIndianData();
      final _pastyear = await _homeService.getPastYearData();
      final _top10 = await _homeService.getTop10Shows();
      final _trending = await _homeService.getTrending();
      final _tensed = await _homeService.getTensed();

      // transform data

      final state1 = _movieResult.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
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
         final trend = res.results;

        // tensed.shuffle();

        return HomeState(
          pastYearMovieList: pastyear,
          trendingMovieList: trending,
          tenseDramaMovieList: tensed,
          southIndianMovieList: southindian,
          trendingTvList: trend,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });
      emit(state1);

      final state2 = _trending.fold((MainFailure fail) {
        return  HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final trending = res.results;
         return HomeState(
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: trending,
          tenseDramaMovieList: state.tenseDramaMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        
       });

      // //send to ui

       emit(state2);

      final state3 = _southIndian.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final southList = res.results;
        
        return HomeState(
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          southIndianMovieList: southList,
          trendingTvList: state.trendingMovieList,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        
        );
        
      });
      emit(state3);

      final state4 = _pastyear.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final pastYear = res.results;
        return HomeState(
          pastYearMovieList: pastYear,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: state.trendingMovieList,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });
      emit(state4);


      final state5 = _top10.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final trending = res.results;
        return HomeState(
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: trending,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });
      emit(state5);


       final state6 =  _tensed.fold((MainFailure fail) {
        return HomeState(
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          isError: true,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }, (HotandNew res) {
        final tensed = res.results;
        return HomeState(
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: tensed,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          isError: false,
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        );
      });
      emit(state6);
    });
  }
}

