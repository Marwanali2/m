import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marovies/features/watch_list/data/model/watch_movies_list_model.dart';
import 'package:marovies/features/watch_list/data/repos/watch_list_repo/watch_list_repo.dart';

part 'watch_list_movies_state.dart';

class WatchListMoviesCubit extends Cubit<WatchListMoviesState> {
  WatchListMoviesCubit(this._watchListRepo) : super(WatchListMoviesInitial());
  final WatchListRepo _watchListRepo;

  Future<void> getWatchListMovies() async {
    emit(WatchListMoviesLoading());
    var result = await _watchListRepo.getWatchList();
    result.fold(
      (failure) => emit(WatchListMoviesFailure(failure.errorMessage)),
      (watchListMovies) => emit(
        WatchListMoviesSuccess(watchListMovies),
      ),
    );
  }
}





