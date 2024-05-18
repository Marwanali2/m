import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';
import 'package:marovies/bottom_nav_bar.dart';
import 'package:marovies/core/utils/assets_data.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/core/utils/shared_prefs.dart';
import 'package:marovies/core/utils/text_styles.dart';

import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_state.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/custom_button.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/custom_text_form_field.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/dont_have_account_and_signup.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/lottie_and_text_section.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/showSnackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:animate_do/animate_do.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? userName;
  String? userPassword;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  @override
  dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateRequestTokenLoadingState ||
            state is ValidateLoginLoadingState ||
            state is CreateSessionLoadingState ||
            state is GetAccountDetailsLoadingState) {
          isLoading = true;
        } else if (state is SuccessCreateRequestToken ||
            state is ValidateLoginSuccessState ||
            state is CreateSessionSucessState) {
          isLoading = false;
         
        } else if (state is GetAccountDetailsSuccessState) {
          showSnackBar(context, 'Welcome', Colors.green);
          isLoading = false;

          Navigator.pushReplacement(
              context,
                MaterialPageRoute(
                  builder: (context) => FadeInLeft(
                        duration: const Duration(seconds: 1),
                        child: const BottomNavBar()
                      )));
              // MaterialPageRoute(
              //     builder: (context) => FadeInLeft(
              //           duration: const Duration(seconds: 1),
              //           child: HomeView(
              //             sessionId: state.sessionId,
              //             userId: state.accountId,
              //           ),
              //         )));
        } else if (state is FailureCreateRequestToken ||
            state is ValidateLoginFailureState ||
            state is CreateSessionFailureState ||
            state is GetAccountDetailsFailureState) {
          final failureState = state as dynamic;
          showSnackBar(context, '${failureState.errorMessage}', Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: Lottie.asset(
            AssetsData.loadingLottie,
            animate: true,
            height: 200,
            width: 200,
          ),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FadeInRight(
                                  duration: const Duration(seconds: 1),
                                  child: const BottomNavBar(),
                                );
                              },
                            ));
                          },
                          child: Text(
                            'Skip',
                            style: AppTextStyles.textStyle16Normal.copyWith(
                              color: AppColorStyles.kSemiCyan,
                              fontSize: 20.sp,
                            ),
                          )),
                    ),
                    const LottieAndTextSection(),
                    CustomTextField(
                      controller: userNameController,
                      keyboardType: TextInputType.emailAddress,
                      label: "User Name",
                      hintText: "enter your user name",
                      onChanged: (data) {
                        userName = data;
                        userName = userNameController.text;
                        if (kDebugMode) {
                          print(
                              '**************** entered user name is $userName****************');
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04.h,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      label: "Password",
                      hintText: "enter your password",
                      onChanged: (data) {
                        userPassword = data;
                        userPassword = passwordController.text;
                        if (kDebugMode) {
                          print(
                              '**************** entered password is $userPassword****************');
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1.h,
                    ),
                    CustomButtonn(
                      text: "Login",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final isLogged =
                              await context.read<AuthCubit>().isLoggedIn();
                          if (isLogged) {
                            final cachedUserToken =
                                await SharedPrefsHelper.getUserToken();
                            final cachedSessionId =
                                await SharedPrefsHelper.getSessionId();
                                 // ignore: use_build_context_synchronously
                                 Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FadeInRight(
                                  duration: const Duration(seconds: 1),
                                  child:  BottomNavBar(sessionId: cachedSessionId,userId: cachedUserToken,),
                                );
                              },
                            ));
                            // Navigator.pushReplacement(
                            //     // ignore: use_build_context_synchronously
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomeView(
                            //               sessionId: cachedSessionId!,
                            //               userId: cachedUserToken!,
                            //             )));
                          } else {
                            // ignore: use_build_context_synchronously
                            await BlocProvider.of<AuthCubit>(context)
                                .getCreateRequestToken();
                            // ignore: use_build_context_synchronously
                            await BlocProvider.of<AuthCubit>(context)
                                .validateLogIn(
                                    userName: userName!,
                                    userPassword: userPassword!);

                            // ignore: use_build_context_synchronously
                            await BlocProvider.of<AuthCubit>(context)
                                .createSession(
                                    requestToken: GlobalVariables.userToken);
                            // ignore: use_build_context_synchronously
                            await BlocProvider.of<AuthCubit>(context)
                                .getAccountDetails();
                          }
                        } else {
                          showSnackBar(
                              context, 'Please enter all fields', Colors.red);
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03.h,
                    ),
                    const DontHaveAccountAndSignUp(),
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
