
import 'package:flutter/material.dart';
import 'package:marovies/features/home/presentation/views/home_view.dart';

class MaroviesApp extends StatelessWidget {
  const MaroviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maro movies app',
      theme: ThemeData.dark().copyWith(
      //  scaffoldBackgroundColor: ColorStyles.kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // ignore: deprecated_member_use
        useMaterial3: true,
        //textTheme:GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeView(),
    );
  }
}
