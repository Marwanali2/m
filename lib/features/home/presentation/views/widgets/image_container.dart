import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  const ImageContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25.h,
      width: MediaQuery.sizeOf(context).width * 0.5.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColorStyles.kPrimaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://image.tmdb.org/t/p/w500$imageUrl'),
        ),
      ),
    );
  }
}
