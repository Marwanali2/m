import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marovies/core/utils/colors.dart';
import 'package:marovies/features/details/presentation/views/details_view.dart';
import 'package:marovies/features/home/presentation/views/managers/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:marovies/features/home/presentation/views/widgets/failure_lottie_widget.dart';
import 'package:marovies/features/home/presentation/views/widgets/home_appbar_and_text.dart';
import 'package:marovies/features/home/presentation/views/widgets/image_container.dart';
import 'package:marovies/features/home/presentation/views/widgets/shimmer_loading_image_container.dart';

class HomeView extends StatefulWidget {
  final String userId, sessionId;
  const HomeView({required this.sessionId, required this.userId, super.key});
  static int mainMovieId=0;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyles.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const HomeAppBarAndText(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02.h,
              ),
            
              BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
                builder: (context, state) {
                  if (state is NowPlayingMoviesSuccess) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.72,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        state.nowPlayingMoviesList.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                HomeView.mainMovieId=state.nowPlayingMoviesList[index].id;
                              });
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsView(
                                    movieId:
                                        state.nowPlayingMoviesList[index].id,
                                    overview: state
                                        .nowPlayingMoviesList[index].overview,
                                    posterPath: state
                                        .nowPlayingMoviesList[index].posterPath,
                                    title:
                                        state.nowPlayingMoviesList[index].title,
                                  );
                                },
                              ));
                            },
                            child: ImageContainer(
                              imageUrl:
                                  state.nowPlayingMoviesList[index].posterPath,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is NowPlayingMoviesFailure) {
                    return const FailureLottieWidget();
                  } else {
                    return const ShimmerLoadingImageContainer();
                  }
                },
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
