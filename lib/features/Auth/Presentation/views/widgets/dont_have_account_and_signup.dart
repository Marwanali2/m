
import 'package:flutter/material.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/functions/launch_url.dart';
import 'package:marovies/core/utils/text_styles.dart';

class DontHaveAccountAndSignUp extends StatelessWidget {
  const DontHaveAccountAndSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "don't have an account ?",
          style: AppTextStyles.textStyle14Normal,
        ),
        GestureDetector(
          onTap: () async {
            launchCustomUrl(context,
                "https://www.themoviedb.org/signup", false);
          },
          child: Text(
            " Sign UP",
            style: AppTextStyles.textStyle16Normal.copyWith(
              color: AppColorStyles.kSemiCyan,
            ),
          ),
        ),
      ],
    );
  }
}
