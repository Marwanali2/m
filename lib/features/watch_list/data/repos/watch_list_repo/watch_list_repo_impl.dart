import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marovies/core/errors/failure.dart';
import 'package:marovies/core/utils/api_services.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/core/utils/shared_prefs.dart';
import 'package:marovies/features/watch_list/data/model/watch_movies_list_model.dart';
import 'package:marovies/features/watch_list/data/repos/watch_list_repo/watch_list_repo.dart';

class WatchListRepoImpl implements WatchListRepo {
  final ApiServices apiServices;

  WatchListRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<MovieWatchListResult>>> getWatchList() async {
    String? cachedSessionId = await SharedPrefsHelper.getSessionId();
    try {
      List<String> moviesPosterList = [];
      List<MovieWatchListResult> watchListMoviesList = [];
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/account/24717925/watchlist/movies?session_id=${GlobalVariables.sessionId}&api_key=${ApiServices.apiKey}',
        options: Options(
          method: 'GET',
        ),
      );
      var responseBody = response.data;
      if (response.statusCode == 200) {
        for (var item in responseBody['results']) {
          moviesPosterList.add(item['poster_path']);
          watchListMoviesList.add(MovieWatchListResult.fromJson(item));
        }
      } else {
        debugPrint(
            'Failed to get watch list movies method with status code : ${response.statusCode}');
        throw Exception('Failed to get watch list movies method');
      }
      return right(watchListMoviesList);
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(
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
