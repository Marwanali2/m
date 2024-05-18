import 'package:dartz/dartz.dart';
import 'package:marovies/core/errors/failure.dart';
import 'package:marovies/features/watch_list/data/model/watch_movies_list_model.dart';

abstract class WatchListRepo {
  Future<Either<Failure, List<MovieWatchListResult>>> getWatchList();
}
