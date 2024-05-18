import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:marovies/core/utils/assets_data.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/core/utils/global_variables.dart';
import 'package:marovies/core/utils/text_styles.dart';
import 'package:marovies/features/home/presentation/views/widgets/failure_lottie_widget.dart';
import 'package:marovies/features/home/presentation/views/widgets/image_container.dart';
import 'package:marovies/features/home/presentation/views/widgets/shimmer_loading_image_container.dart';
import 'package:marovies/features/watch_list/presentation/managers/watch_list_cubit/watch_list_movies_cubit.dart';
import 'package:marovies/features/watch_list/presentation/views/watch_list_view_details.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});
  static int movieInWatchedListId = 0;

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  @override
  void initState() {
    GlobalVariables.sessionId == '' ?   null:fetchWatchListMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // BlocProvider.of<WatchListMoviesCubit>(context).getWatchListMovies();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyles.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
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
              GlobalVariables.sessionId == ''
                  ? Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2.h),
                        Lottie.asset(
                          AssetsData.emptyWatchListLottie,
                        ),
                        Text(
                          'Please login to view your watch list',
                          style: AppTextStyles.textStyle16Normal,
                        )
                      ],
                    )
                  : BlocBuilder<WatchListMoviesCubit, WatchListMoviesState>(
                      builder: (context, state) {
                        //BlocProvider(create: (context) => AuthCubit()..createSession);
                        if (state is WatchListMoviesSuccess) {
                          return GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.72,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              state.watchListMovies.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      WatchListView.movieInWatchedListId =
                                          state.watchListMovies[index].id;
                                    });
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return WatchListViewDetails(
                                          movieId:
                                              state.watchListMovies[index].id,
                                          overview: state
                                              .watchListMovies[index].overview,
                                          posterPath: state
                                              .watchListMovies[index]
                                              .posterPath,
                                          title: state
                                              .watchListMovies[index].title,
                                        );
                                      },
                                    ));
                                  },
                                  child: ImageContainer(
                                    imageUrl:
                                        state.watchListMovies[index].posterPath,
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is WatchListMoviesFailure) {
                          return const FailureLottieWidget();
                        } else {
                          return const ShimmerLoadingImageContainer();
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  void fetchWatchListMovies() {
    BlocProvider.of<WatchListMoviesCubit>(context).getWatchListMovies();
  }
}
