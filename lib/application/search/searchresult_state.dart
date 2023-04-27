part of 'searchresult_bloc.dart';

@freezed
class SearchresultState with _$SearchresultState {
  const factory SearchresultState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchresultState;

  factory SearchresultState.initial() => const SearchresultState(
      idleList: [], isError: false, isLoading: false, searchResultList: []);
}
