
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/text_styles.dart';

class TitleAndDesc extends StatelessWidget {
  const TitleAndDesc({super.key, this.overview, this.title});
  final String? overview;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: AppTextStyles.textStyle16Normal.copyWith(
              color: AppColorStyles.kSemiCyan,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
          Center(
            child: Text('About Movie',
                style: AppTextStyles.textStyle40WhiteNormal.copyWith(
                  fontSize: 30.sp,
                  color: AppColorStyles.kSecondaryColor,
                )),
          ),
          Text(
            overview == '' ? 'No Available Desccription' : overview!,
            style: AppTextStyles.textStyle16Normal.copyWith(
              color: overview == '' ? Colors.red : Colors.white,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
