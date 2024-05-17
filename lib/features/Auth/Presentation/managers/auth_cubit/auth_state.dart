abstract class AuthState {}

class AuthInitialState extends AuthState {}

// create request token
class CreateRequestTokenLoadingState extends AuthState {}

class FailureCreateRequestToken extends AuthState {
  String? errorMessage;

  FailureCreateRequestToken({required this.errorMessage});
}

class SuccessCreateRequestToken extends AuthState {
  final String requestToken;

  SuccessCreateRequestToken({required this.requestToken});
}

// validate login
class ValidateLoginLoadingState extends AuthState {}

class ValidateLoginSuccessState extends AuthState {
  final String userToken;

  ValidateLoginSuccessState({required this.userToken});
}

class ValidateLoginFailureState extends AuthState {
  String? errorMessage;

  ValidateLoginFailureState({required this.errorMessage});
}

// create session
class CreateSessionLoadingState extends AuthState {}

class CreateSessionFailureState extends AuthState {
  String? errorMessage;

  CreateSessionFailureState({required this.errorMessage});
}

class CreateSessionSucessState extends AuthState {
   String? sessionId;

  CreateSessionSucessState({required this.sessionId});
}

// get account details
class GetAccountDetailsLoadingState extends AuthState {}

class GetAccountDetailsFailureState extends AuthState {
  String? errorMessage;

  GetAccountDetailsFailureState({required this.errorMessage});
}

class GetAccountDetailsSuccessState extends AuthState {
final String accountId;
final String sessionId;
  GetAccountDetailsSuccessState({required this.accountId,required this.sessionId});
}
