import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marovies/core/routing/app_router.dart';
import 'package:marovies/marovies_app.dart';
import 'package:marovies/simple_bloc_observer.dart';
void main() {
  // SystemChrome.setSystemUIOverlayStyle( // do run not hot  realod
  //    SystemUiOverlayStyle(
  //     statusBarColor: ColorStyles
  //         .kPrimaryColor, // Set the status bar color to kPrimaryColor
  //     statusBarIconBrightness:
  //     Brightness.light, // Set the status bar icon color to light
  //   ),
  // );
  Bloc.observer = SimpleBlocObserver();
  
  runApp( MaroviesApp(appRouter: AppRouter(),));
}

