import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/bottom_nav_bar.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/text_styles.dart';
import 'package:marovies/core/widgets/custom_loading_widget.dart';
import 'package:marovies/features/Auth/Presentation/views/widgets/showSnackBar.dart';
import 'package:marovies/features/details/presentation/managers/add_to_watch_list_cubit.dart/add_to_watch_list_cubit.dart';
import 'package:marovies/features/watch_list/presentation/views/managers/remove_from_watch_list_cubit.dart/remove_from_watch_list_cubit.dart';
import 'package:marovies/features/watch_list/presentation/views/watch_list_view.dart';

class WatchListDetailsViewAppbar extends StatefulWidget {
  final int? movieId;
  const WatchListDetailsViewAppbar({
    super.key,
    required this.movieId,
  });

  @override
  State<WatchListDetailsViewAppbar> createState() =>
      _WatchListDetailsViewAppbarState();
}

class _WatchListDetailsViewAppbarState
    extends State<WatchListDetailsViewAppbar> {
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
        Text('Watch List Movie Detail', style: AppTextStyles.textStyle16Normal),
        BlocConsumer<RemoveFromWatchListMoviesCubit,
            RemoveFromWatchListMoviesState>(
          listener: (context, state) {
            if (state is RemoveFromWatchListMoviesSuccess) {
              showSnackBar(
                context,
                'Removed From Watch List Successfully',
                AppColorStyles.kSemiBlue,
              );
            } else if (state is RemoveFromWatchListMoviesFailure) {
              showSnackBar(
                  context,
                  'Failed to remove movie from watch list, ${state.errorMessage}',
                  Colors.red);
            } else if (state is RemoveFromWatchListMoviesLoading) {
              const CustomLoadingWidget();
            }
          },
          builder: (context, state) => IconButton(
            onPressed: () {
              // remove from watch list
              BlocProvider.of<RemoveFromWatchListMoviesCubit>(context)
                  .removeFromWatchList();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(),
                  ));
            },
            icon: Icon(
              Icons.bookmark_outlined,
              size: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}
