import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marovies/core/routing/app_router.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/marovies_app.dart';
import 'package:marovies/simple_bloc_observer.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle( 
     const SystemUiOverlayStyle(
      statusBarColor: AppColorStyles
          .kPrimaryColor, 
      statusBarIconBrightness:
      Brightness.light, 
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  
  runApp( MaroviesApp(appRouter: AppRouter(),));
}

