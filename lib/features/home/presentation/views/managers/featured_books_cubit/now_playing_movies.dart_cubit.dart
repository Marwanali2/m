import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:marovies/features/home/data/models/now_playing_movies_model.dart';
import 'package:marovies/features/home/data/repos/home_repo.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this._homeRepo) : super(NowPlayingMoviesInitial());
  final HomeRepo _homeRepo;

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    var result = await _homeRepo.getNowPlayingMovies();
    result.fold(
      (failure) => emit(NowPlayingMoviesFailure(failure.errorMessage)),
      (nowPlayingMovies) => emit(
        NowPlayingMoviesSuccess(nowPlayingMovies),
      ),
    );
  }
}
