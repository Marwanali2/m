import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/text_styles.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyles.kPrimaryColor,
        body: ListView(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Text(
                'Watch List',
                style: AppTextStyles.textStyle25Normal.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.72,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                10,
                (index) {
                  return Image.asset('assets/images/movie-1.png');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
