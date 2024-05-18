import 'package:dartz/dartz.dart';
import 'package:marovies/core/errors/failure.dart';
import 'package:marovies/features/home/data/models/now_playing_movies_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Result>>> getNowPlayingMovies();
} 