
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/text_styles.dart';

class DetailsViewAppbar extends StatelessWidget {
  const DetailsViewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        Text('Detail', style: AppTextStyles.textStyle16Normal),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border,
            size: 25.sp,
          ),
        ),
      ],
    );
  }
}
