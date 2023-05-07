

import 'package:dartz/dartz.dart';
import 'package:netflix_ui/Domain/HotAndNew/Models/hotand_new.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';

abstract class HotandNewService{
    Future<Either<MainFailure,HotandNew>> getHotAndNewMovieData();
    Future<Either<MainFailure,HotandNew>> getHotAndNewTVData();
    
}