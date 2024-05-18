import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:marovies/features/home/data/models/now_playing_movies_model.dart';
import 'package:marovies/features/home/data/repos/home_repo.dart';

part 'now_playing_movies_state.dart';

// class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
//   NowPlayingMoviesCubit(this._homeRepo) : super(NowPlayingMoviesInitial());
//   final HomeRepo _homeRepo;

//   Future<void> getNowPlayingMovies() async {
//     emit(NowPlayingMoviesLoading());
//     var result = await _homeRepo.getNowPlayingMovies();
//     result.fold(
//       (failure) => emit(NowPlayingMoviesFailure(failure.errorMessage)),
//       (nowPlayingMovies) => emit(
//         NowPlayingMoviesSuccess(nowPlayingMovies),
//       ),
//     );
//   }
// }

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this._homeRepo) : super(NowPlayingMoviesInitial());
  final HomeRepo _homeRepo;

  int currentPage = 1;
  bool isFetching = false;

  Future<void> getNowPlayingMovies({int page = 1, bool isLoadMore = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (!isLoadMore) {
      emit(NowPlayingMoviesLoading());
    } else if (state is NowPlayingMoviesSuccess) {
      final currentState = state as NowPlayingMoviesSuccess;
      emit(NowPlayingMoviesSuccess(currentState.nowPlayingMoviesList, isLoadingMore: true));
    }

    var result = await _homeRepo.getNowPlayingMovies(page: page);
    result.fold(
      (failure) => emit(NowPlayingMoviesFailure(failure.errorMessage)),
      (nowPlayingMovies) {
        if (isLoadMore && state is NowPlayingMoviesSuccess) {
          final currentState = state as NowPlayingMoviesSuccess;
          emit(NowPlayingMoviesSuccess(currentState.nowPlayingMoviesList + nowPlayingMovies, isLoadingMore: false));
        } else {
          emit(NowPlayingMoviesSuccess(nowPlayingMovies));
        }
      },
    );

    isFetching = false;
    currentPage = page;
  }

  Future<void> loadMoreMovies() async {
    await getNowPlayingMovies(page: currentPage + 1, isLoadMore: true);
  }
}




