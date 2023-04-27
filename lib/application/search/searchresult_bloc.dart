import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/Domain/Downloads/Models/downloads.dart';
import 'package:netflix_ui/Domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_ui/Domain/Search/Models/search_result/search_result.dart';
import 'package:netflix_ui/Domain/Search/search_service.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';
import 'dart:developer';

part 'searchresult_event.dart';
part 'searchresult_state.dart';
part 'searchresult_bloc.freezed.dart';

@injectable
class SearchresultBloc extends Bloc<SearchresultEvent, SearchresultState> {
  final IDownloadRepo _downloadService;
  final SearchServices _searchService;
  SearchresultBloc(this._downloadService, this._searchService)
      : super(SearchresultState.initial()) {
    /* 
    idleState Event
    */
    on<_Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchresultState(
          idleList: state.idleList,
          isError: false,
          isLoading: true,
          searchResultList: [],
        ));
        return;
      }
      emit(SearchresultState(
        idleList: [],
        isError: false,
        isLoading: true,
        searchResultList: [],
      ));
      //Trending
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return SearchresultState(
            idleList: [],
            isError: true,
            isLoading: false,
            searchResultList: [],
          );
        },
        (List<Downloads> list) {
          return SearchresultState(
            idleList: list,
            isError: false,
            isLoading: true,
            searchResultList: [],
          );
        },
      );
      //UI

      emit(_state);
    });
    /* 
    SearchState Event
    */
    on<SearchMovies>((event, emit) async {
      // CallSearch
      log('Searching for ${event.movieQuery}');
      emit(
        SearchresultState(
          idleList: [],
          isError: false,
          isLoading: true,
          searchResultList: [],
        ),
      );
      final _results =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _results.fold(
        (MainFailure f) {
          return SearchresultState(
            idleList: [],
            isError: true,
            isLoading: false,
            searchResultList: [],
          );
        },
        (SearchResult r) {
          return SearchresultState(
            idleList: [],
            isError: false,
            isLoading: false,
            searchResultList: r.results,
          );
        },
      );

      //add to ui
      emit(_state);
    });
  }
}
