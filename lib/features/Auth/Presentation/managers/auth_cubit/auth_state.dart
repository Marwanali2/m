abstract class AuthState {}

class AuthInitialState extends AuthState {}

class CreateRequestTokenLoadingState extends AuthState {}
class FailureCreateRequestToken extends AuthState {
  String? errorMessage;

  FailureCreateRequestToken({required this.errorMessage});
}

class SuccessCreateRequestToken extends AuthState {
  final String requestToken;

  SuccessCreateRequestToken({required this.requestToken});
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  String? errorMessage;

  LoginFailureState({required this.errorMessage});
}
