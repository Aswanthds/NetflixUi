part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
        pastYearMovieList: [],
        trendingMovieList: [],
        tenseDramaMovieList: [],
        southIndianMovieList: [],
        trendingTvList: [],
        isLoading: false,
        isError: false, 
        stateId: '0',
      );

  
}
