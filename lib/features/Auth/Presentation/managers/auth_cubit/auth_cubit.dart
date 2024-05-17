import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marovies/core/utils/api_services.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  String userToken = '';
  String sessionId = '';
  Future getCreateRequestToken() async {
    emit(CreateRequestTokenLoadingState());
    try {
      var response = await ApiServices.dio.get(
        '${ApiServices.baseUrl}/authentication/token/new?api_key=$apiKey',
        options: Options(
          method: 'GET',
        ),
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        userToken = responseBody['request_token'];
        emit(SuccessCreateRequestToken(requestToken: userToken));
      } else {
        debugPrint(
            'Failed to get token from create request token method with status code : ${response.statusCode}');
        emit(FailureCreateRequestToken(errorMessage: response.data.toString()));
        throw Exception('Failed to implement create request token');
      }
    } on Exception catch (e) {
      debugPrint('Failed to create request token , The Reason : $e');
      emit(FailureCreateRequestToken(errorMessage: e.toString()));
    }
  }

  Future validateLogIn(
      {required String userName, required String userPassword}) async {
    emit(ValidateLoginLoadingState());

    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({
        "username": userName,
        "password": userPassword,
        "request_token": userToken,
      });
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/authentication/token/validate_with_login?api_key=$apiKey',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        userToken = responseBody['request_token'];
        emit(ValidateLoginSuccessState(userToken: userToken));
      } else {
        debugPrint(
            'Failed to validate login method with status code : ${response.statusCode}');
        emit(ValidateLoginFailureState(errorMessage: response.data.toString()));
        throw Exception('Failed to implement validate login');
      }
    } on Exception catch (e) {
      debugPrint('Failed to validate login , The Reason : $e');

      emit(ValidateLoginFailureState(errorMessage: e.toString()));
    }
  }

  Future createSession({required String requestToken}) async {
    emit(CreateSessionLoadingState());
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({"request_token": userToken});
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/authentication/session/new?api_key=$apiKey',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        sessionId = responseBody['session_id'];
        emit(CreateSessionSucessState(sessionId: sessionId));
      } else {
        debugPrint(
            'Failed to create session method with status code : ${response.statusCode}');
        emit(CreateSessionFailureState(errorMessage: response.data.toString()));
        throw Exception('Failed to implement create session');
      }
    } on Exception catch (e) {
      debugPrint('Failed to create session , The Reason : $e');
      emit(CreateSessionFailureState(errorMessage: e.toString()));
    }
  }

  void onChange(Change<AuthState> change) {
    // بتعرفني الكيوبتي اشتغل ولا لا بالترتيب مع الاستيت
    super.onChange(change);
    print('Change : $change');
  }
}
