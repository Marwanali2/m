import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marovies/core/utils/colors.dart';

abstract class AppTextStyles {
  static const textStyle8Normal = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.normal,
  );

  static const textStyle12Normal = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const textStyle14Normal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16Normal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal, //bold
  );

  static const textStyle24Normal = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal, //medium
  );
  static const textStyle25Normal = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.normal, //medium
    color: AppColorStyles.kBlackColor,
  );

  static TextStyle textStyle40WhiteNormal = GoogleFonts.dancingScript(
    fontSize: 40.sp,
    fontWeight: FontWeight.normal,
  );
}
