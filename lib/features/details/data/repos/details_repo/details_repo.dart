import 'package:dartz/dartz.dart';
import 'package:marovies/core/errors/failure.dart';
abstract class DetailsRepo {
  Future<Either<Failure, void>> addToWatchList();
  Future<Either<Failure, void>> removeFromWatchList();
} 