import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/features/home/presentation/views/widgets/home_appbar_and_text.dart';
import 'package:marovies/features/home/presentation/views/widgets/image_container.dart';

class HomeView extends StatelessWidget {
  final String userId, sessionId;
  const HomeView({required this.sessionId, required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyles.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const HomeAppBarAndText(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02.h,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  100,
                  (index) {
                    return const ImageContainer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
