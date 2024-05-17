import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:marovies/core/utils/assets_data.dart';
import 'package:marovies/core/utils/text_styles.dart';

class LottieAndTextSection extends StatelessWidget {
  const LottieAndTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02.h,
        ),
        Center(
          child: Lottie.asset(
            AssetsData.loginLottie,
            height: MediaQuery.sizeOf(context).height * 0.2.h,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Login',
            style: AppTextStyles.textStyle40WhiteNormal,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02.h,
        ),
      ],
    );
  }
}
