import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/Domain/HotAndNew/Models/hotand_new.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_ui/Domain/HotAndNew/hot_and_new_service.dart';
import 'package:netflix_ui/Domain/core/api_end_points.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';


@LazySingleton(as: HotandNewService)
class HotAndNewImplementation implements HotandNewService {
  @override
  Future<Either<MainFailure, HotandNew>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandnewmovie,
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotandNew.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, HotandNew>> getHotAndNewTVData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandnewtv,
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotandNew.fromJson(response.data);
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
