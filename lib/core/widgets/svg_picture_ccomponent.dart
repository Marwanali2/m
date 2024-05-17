import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureComponent extends StatelessWidget {
  const SvgPictureComponent({
    super.key,
    required this.name,
    required this.width,
    required this.height,
    this.color,
  });
  final String name;
  final double width;
  final double height;
  final Color?color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      height: height.h,
      width: width.w,
      color: color,
    );
  }
}
