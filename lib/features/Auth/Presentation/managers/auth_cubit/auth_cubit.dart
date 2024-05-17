import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marovies/core/utils/api_services.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/core/utils/shared_prefs.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future getCreateRequestToken() async {
    emit(CreateRequestTokenLoadingState());
    try {
      var response = await ApiServices.dio.get(
        '${ApiServices.baseUrl}/authentication/token/new?api_key=${ApiServices.apiKey}',
        options: Options(
          method: 'GET',
        ),
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        GlobalVariables.userToken = responseBody['request_token'];
        await SharedPrefsHelper.setUserToken(GlobalVariables.userToken);
        emit(SuccessCreateRequestToken(requestToken: GlobalVariables.userToken));
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
        "request_token":GlobalVariables. userToken,
      });
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/authentication/token/validate_with_login?api_key=${ApiServices.apiKey}',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
      GlobalVariables.  userToken = responseBody['request_token'];
     await SharedPrefsHelper.setUserToken(GlobalVariables.userToken); 
        emit(ValidateLoginSuccessState(userToken: GlobalVariables.userToken));
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
      var data = json.encode({"request_token": GlobalVariables.userToken});
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/authentication/session/new?api_key=${ApiServices.apiKey}',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
        GlobalVariables.sessionId = responseBody['session_id'];
     await SharedPrefsHelper.setSessionId(GlobalVariables.sessionId); // Cache sessionId
       
        emit(CreateSessionSucessState(sessionId: GlobalVariables.sessionId));
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

  Future getAccountDetails() async {
    emit(GetAccountDetailsLoadingState());
    try {
      var response = await ApiServices.dio.request(
        '${ApiServices.baseUrl}/account?session_id=${GlobalVariables.sessionId}&api_key=${ApiServices.apiKey}',
        options: Options(
          method: 'GET',
        ),
      );
      var responseBody = response.data;
      if (response.statusCode == 200 || responseBody['success'] == true) {
       GlobalVariables. accountId = responseBody['id'].toString();
await SharedPrefsHelper.setAccountId(GlobalVariables.accountId); 

        emit(GetAccountDetailsSuccessState(accountId:GlobalVariables. accountId,sessionId:GlobalVariables. sessionId));
      } else {
        debugPrint(
            'Failed to get account ID from get account details method with status code : ${response.statusCode}');
        emit(GetAccountDetailsFailureState(
            errorMessage: response.data.toString()));
        throw Exception('Failed to implement get account details');
      }
    } catch (e) {
      debugPrint('Failed to get account details , The Reason : $e');
      emit(GetAccountDetailsFailureState(errorMessage: e.toString()));
    }
  }


Future<bool> isLoggedIn() async {
  final userToken = await SharedPrefsHelper.getUserToken();
  final sessionId = await SharedPrefsHelper.getSessionId();

  return userToken != null && sessionId != null;
}


  @override
  void onChange(Change<AuthState> change) {
    // بتعرفني الكيوبتي اشتغل ولا لا بالترتيب مع الاستيت
    super.onChange(change);
    if (kDebugMode) {
      print('Change : $change');
    }
  }
}
