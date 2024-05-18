import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:marovies/core/utils/assets_data.dart';

class FailureLottieWidget extends StatelessWidget {
  const FailureLottieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsData.errorLottie,
        width: 300.w,
        height: 300.h,
      ),
    );
  }
}
