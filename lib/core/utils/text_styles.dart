import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marovies/core/utils/colors.dart';

abstract class AppTextStyles {
  static final textStyle8Normal = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.normal,
  );

  static final textStyle12Normal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );

  static final textStyle14Normal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static final textStyle16Normal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal, //bold
  );

  static final textStyle24Normal = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal, //medium
  );
  static final textStyle25Normal = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.normal, //medium
    color: AppColorStyles.kBlackColor,
  );

  static TextStyle textStyle40WhiteNormal = GoogleFonts.dancingScript(
    fontSize: 40.sp,
    fontWeight: FontWeight.normal,
  );
}
