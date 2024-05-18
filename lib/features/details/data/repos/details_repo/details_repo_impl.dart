import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marovies/core/errors/failure.dart';
import 'package:marovies/core/utils/api_services.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/features/details/data/repos/details_repo/details_repo.dart';
import 'package:marovies/features/home/presentation/views/home_view.dart';

class DetailsRepoImpl implements DetailsRepo{
    late final ApiServices apiServices;

  DetailsRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, void>> addToWatchList() async{
   try{
    var headers = {
  'Content-Type': 'application/json'
};
var data = json.encode({
  "media_type": "movie",
  "media_id": HomeView.mainMovieId,
  "watchlist": true,
});
var response = await ApiServices.dio.request(
  '${ApiServices.baseUrl}/account/21273599/watchlist?session_id=${GlobalVariables.sessionId}&api_key=${ApiServices.apiKey}',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);
var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        debugPrint('Added to watchlist');
      } else {
        debugPrint(
            'Failed to add to watch list method with status code : ${response.statusCode}');
        throw Exception('Failed toadd to watch list method');
      }
      return right(null);
   }
   on Exception catch (e) {
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

  @override
  Future<Either<Failure, void>> removeFromWatchList() async{
   try{
    var headers = {
  'Content-Type': 'application/json'
};
var data = json.encode({
  "media_type": "movie",
  "media_id": HomeView.mainMovieId,
  "watchlist": false,
});
var response = await ApiServices.dio.request(
  '${ApiServices.baseUrl}/account/21273599/watchlist?session_id=${GlobalVariables.sessionId}&api_key=${ApiServices.apiKey}',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);
var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        debugPrint('Added to watchlist');
      } else {
        debugPrint(
            'Failed to add to watch list method with status code : ${response.statusCode}');
        throw Exception('Failed toadd to watch list method');
      }
      return right(null);
   }
   on Exception catch (e) {
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