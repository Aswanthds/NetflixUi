import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_ui/Domain/Search/Models/search_result/search_result.dart';
import 'package:netflix_ui/Domain/Search/search_service.dart';
import 'package:netflix_ui/Domain/core/api_end_points.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';
import 'dart:developer';

@LazySingleton(as: SearchServices)
class SearchImpl implements SearchServices {
  @override
  Future<Either<MainFailure, SearchResult>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResult.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (f) {
      log(f.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
