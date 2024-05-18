import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marovies/core/Dependency_injection/service_locator.dart';
import 'package:marovies/core/routing/app_router.dart';
import 'package:marovies/core/routing/routes.dart';
import 'package:marovies/features/Auth/Presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:marovies/features/details/data/repos/details_repo/details_repo_impl.dart';
import 'package:marovies/features/details/presentation/managers/add_to_watch_list_cubit.dart/add_to_watch_list_cubit.dart';
import 'package:marovies/features/home/data/repos/home_repo_impl.dart';
import 'package:marovies/features/home/presentation/views/managers/now_playing_movies_cubit/now_playing_movies_cubit.dart';

class MaroviesApp extends StatelessWidget {
  final AppRouter appRouter;

  const MaroviesApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
            create: (context) => NowPlayingMoviesCubit(
              getIt.get<HomeRepoImpl>(),
            )..getNowPlayingMovies(),
          ),
           BlocProvider(create: (context) => AddToWatchListMoviesCubit(
             getIt.get<DetailsRepoImpl>(),
           )),
        ],
        child: MaterialApp(
          title: 'Marovies app',
          theme: ThemeData.dark().copyWith(
            //  scaffoldBackgroundColor: ColorStyles.kPrimaryColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // ignore: deprecated_member_use
            useMaterial3: true,
            textTheme: GoogleFonts.ubuntuTextTheme(ThemeData.dark().textTheme),
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.kMain,
        ),
      ),
    );
  }
}
