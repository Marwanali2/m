import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/text_styles.dart';

class CustomButtonn extends StatelessWidget {
  CustomButtonn({super.key, this.text, this.onPressed});
  String? text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 50.h)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: onPressed,
      child: Text(
        "$text",
        style: AppTextStyles.textStyle25Normal,
      ),
    );
  }
}
