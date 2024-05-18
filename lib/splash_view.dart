import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marovies/bottom_nav_bar.dart';
import 'package:marovies/core/utils/assets_data.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/shared_prefs.dart';
import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:marovies/features/Auth/Presentation/views/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // ignore: unused_field
  late final AuthCubit _authCubit;
  String? userToken = '';
  String? sessionId = '';
  String? userId = '';
  @override
  void initState() {
    super.initState();
    _authCubit = BlocProvider.of<AuthCubit>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isLoggedIn = await _checkCachedCredentials();
      if (isLoggedIn) {
        _navigateToHome();
      } else {}
    });
  }

  Future<bool> _checkCachedCredentials() async {
    userToken = await SharedPrefsHelper.getUserToken();
    sessionId = await SharedPrefsHelper.getSessionId();
    userId = await SharedPrefsHelper.getAccountId();

    return userToken != null && sessionId != null;
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(AssetsData.splashLottie),
      backgroundColor: AppColorStyles.kPrimaryColor,
      nextScreen: BounceInDown(
          curve: Curves.bounceInOut,
          duration: const Duration(seconds: 2),
          child: const LoginView()),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      curve: Curves.easeIn,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
