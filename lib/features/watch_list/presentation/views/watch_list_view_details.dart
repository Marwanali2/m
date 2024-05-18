import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/features/details/presentation/views/widgets/movie_title_and_desc.dart';
import 'package:marovies/features/watch_list/presentation/views/widgets/watch_list_details_view_appbar.dart';

class WatchListViewDetails extends StatelessWidget {
  final String? overview;
  final String? title;
  final String? posterPath;
  final int? movieId;
  const WatchListViewDetails(
      {super.key, this.overview, this.title, this.posterPath, this.movieId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColorStyles.kPrimaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                WatchListDetailsViewAppbar(movieId: movieId,),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03.h),
                Image.network(
                  'https://image.tmdb.org/t/p/w500$posterPath',
                  width: double.infinity,
                  height: 210.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
                TitleAndDesc(
                  title: title,
                  overview: overview,
                ),
              ],
            ),
          )),
    );
  }
}
