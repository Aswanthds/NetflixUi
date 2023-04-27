part of 'searchresult_bloc.dart';

@freezed
class SearchresultEvent with _$SearchresultEvent {
  const factory SearchresultEvent.initialize() = _Initialize;
  const factory SearchresultEvent.searchMovies({required String movieQuery}) =
      SearchMovies;
}
