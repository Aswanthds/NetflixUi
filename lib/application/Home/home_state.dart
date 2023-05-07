part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> SouthIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
        pastYearMovieList: [],
        trendingMovieList: [],
        tenseDramaMovieList: [],
        SouthIndianMovieList: [],
        trendingTvList: [],
        isLoading: false,
        isError: false, 
        stateId: '0',
      );
}
