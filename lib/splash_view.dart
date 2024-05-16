import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marovies/core/utils/assets_data.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/features/home/presentation/views/home_view.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(AssetsData.splashLottie),
      backgroundColor: ColorStyles.kPrimaryColor,
      nextScreen: const HomeView(),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      curve: Curves.easeIn,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
