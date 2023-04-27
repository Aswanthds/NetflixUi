import 'package:dartz/dartz.dart';
import 'package:netflix_ui/Domain/Search/Models/search_result/search_result.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';

abstract class SearchServices {
  Future<Either<MainFailure, SearchResult>> searchMovies({
    required String movieQuery,
  });
}
