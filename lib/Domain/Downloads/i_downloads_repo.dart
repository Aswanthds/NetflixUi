import 'package:dartz/dartz.dart';
import 'package:netflix_ui/Domain/Downloads/Models/downloads.dart';
import 'package:netflix_ui/Domain/core/failures/main_failure.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
