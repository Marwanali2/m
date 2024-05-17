import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/functions/launch_url.dart';
import 'package:marovies/core/utils/text_styles.dart';
import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_state.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/custom_button.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/custom_text_form_field.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/lottie_and_text_section.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/showSnackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  static String id = 'LoginScreen';
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
    String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          // Navigator.pushReplacementNamed(context, AppRouter.kHomeView,
          //     arguments: email!);
          //  Navigator.of(context).push(
          //       AppRouter.kHomeView,
          //       extra: email!
          //   );
          isLoading = false;
          showSnackBar(context, 'Welcome', Colors.green);
        } else if (state is LoginFailureState) {
          showSnackBar(context, '${state.errorMessage}', Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          opacity: 0,
          child: Scaffold(
            backgroundColor: AppColorStyles.kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const LottieAndTextSection(),
                    CustomTextField(
                      label: "Email",
                      hintText: "enter your email",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04.h,
                    ),
                    CustomTextField(
                      label: "Password",
                      hintText: "enter your password",
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1.h,
                    ),
                    CustomButtonn(
                      text: "Login",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .logIn(email: email!, password: password!);
                        } else {}
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "don't have an account ?",
                          style: AppTextStyles.textStyle14Normal,
                        ),
                        GestureDetector(
                          onTap: () async {
                            launchCustomUrl(context,
                                "https://www.themoviedb.org/signup", false);
                          },
                          child: Text(
                            " Sign UP",
                            style: AppTextStyles.textStyle16Normal.copyWith(
                              color: AppColorStyles.kSemiCyan,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}