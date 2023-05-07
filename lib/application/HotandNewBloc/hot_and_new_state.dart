part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required bool isLoading,
    required bool isError,
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isError: false,
        isLoading: false,
      );
}
