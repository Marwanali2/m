
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FailureLottieWidget extends StatelessWidget {
  const FailureLottieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
        'https://lottie.host/1dc629d7-2756-4837-a15a-ab9a02133a8d/gAbfD1ZfoM.json',
        width: 100.w,
        height: 100.h,
      ),
    );
  }
}
