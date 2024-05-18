
import 'package:flutter/material.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/features/home/presentation/views/widgets/image_container.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingImageContainer extends StatelessWidget {
  const ShimmerLoadingImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      childAspectRatio: 0.72,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        4,
        (index) {
          return Shimmer.fromColors(
            baseColor: AppColorStyles.kPrimaryColor,
            highlightColor: AppColorStyles.kSemiBlue,
            child: const ImageContainer(
              imageUrl: '',
            ),
          );
        },
      ),
    );
  }
}
