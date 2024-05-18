import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/core/utils/text_styles.dart';
import 'package:marovies/core/widgets/custom_loading_widget.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/showSnackBar.dart';
import 'package:marovies/features/details/presentation/managers/add_to_watch_list_cubit.dart/add_to_watch_list_cubit.dart';

class DetailsViewAppbar extends StatefulWidget {
  const DetailsViewAppbar({
    super.key,
  });

  @override
  State<DetailsViewAppbar> createState() => _DetailsViewAppbarState();
}

class _DetailsViewAppbarState extends State<DetailsViewAppbar> {
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
        BlocConsumer<AddToWatchListMoviesCubit, AddToWatchListMoviesState>(
          listener: (context, state) {
            if (state is AddToWatchListMoviesSuccess) {
              showSnackBar(
                context,
                'Added To Watch List Successfully',
                Colors.green,
              );
            } else if (state is AddToWatchListMoviesFailure) {
              showSnackBar(
                  context, 'Failed to add movie to watch list', Colors.red);
            } else {
              const CustomLoadingWidget();
            }
          },
          builder: (context, state) => IconButton(
            onPressed: () {
              if (GlobalVariables.sessionId.isEmpty) {
                showSnackBar(
                    context,
                    'You need to login first to bookmark this movie',
                    Colors.red);
              } else {
                BlocProvider.of<AddToWatchListMoviesCubit>(context)
                    .addToWatchList();
              }
            },
            icon: Icon(
              Icons.bookmark_border,
              size: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}
