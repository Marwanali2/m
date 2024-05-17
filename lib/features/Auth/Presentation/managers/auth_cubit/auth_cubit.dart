import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> registerUser({required String email,required String password}) async {
    emit(RegisterLoadingState());
    try {
    
      emit(RegisterSuccessState());
    }
    

    on Exception catch (e) {
      emit(RegisterFailureState(errorMessage: 'Some thing went wrong '));
    }
  }



  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
     

      emit(LoginSuccessState());
    }  on Exception catch (e) {
      emit(LoginFailureState(errorMessage: 'Some thing went wrong '));
    }
  }

  void onChange(Change<AuthState>change){// بتعرفني الكيوبتي اشتغل ولا لا بالترتيب مع الاستيت
    super.onChange(change);
    print('Change : $change');
  }

}
