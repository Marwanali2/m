
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/text_styles.dart';

class HomeAppBarAndText extends StatelessWidget {
  const HomeAppBarAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('What do you want to watch?',
              style: AppTextStyles.textStyle24Normal.copyWith(
                color: AppColorStyles.kSemiCyan,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.07.h),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Now Playing Movies',
            style: AppTextStyles.textStyle40WhiteNormal.copyWith(
              color: AppColorStyles.kSemiCyan,
              fontSize: 30.sp,
            ),
          ),
        ),
      ],
    );
  }
}
