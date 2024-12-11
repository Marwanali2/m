import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marovies/core/errors/failure.dart';
import 'package:marovies/features/home/data/models/now_playing_movies_model.dart';
import 'package:marovies/features/home/data/repos/home_repo.dart';
import '../../../../core/utils/api_services.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<Result>>> getNowPlayingMovies({int page = 1}) async {
    try {
      List<Result> nowPlayingMoviesList = [];
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/movie/now_playing?api_key=${ApiServices.apiKey}&page=$page',
        options: Options(
          method: 'GET',
        ),
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        for (var item in responseBody['results']) {
          nowPlayingMoviesList.add(Result.fromJson(item));
        }
      } else {
        debugPrint(
            'Failed to get now playing movies method with status code : ${response.statusCode}');
        throw Exception('Failed to get now playing movies method');
      }
      return right(nowPlayingMoviesList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
