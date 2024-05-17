import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marovies/core/utils/api_services.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  String userToken = '';
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

  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      emit(LoginSuccessState());
    } on Exception catch (e) {
      emit(LoginFailureState(errorMessage: 'Some thing went wrong '));
    }
  }

  void onChange(Change<AuthState> change) {
    // بتعرفني الكيوبتي اشتغل ولا لا بالترتيب مع الاستيت
    super.onChange(change);
    print('Change : $change');
  }
}
