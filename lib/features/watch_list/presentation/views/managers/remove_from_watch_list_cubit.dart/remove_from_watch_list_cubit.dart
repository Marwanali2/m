import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marovies/features/details/data/repos/details_repo/details_repo.dart';
part 'remove_from_watch_list_state.dart';

class RemoveFromWatchListMoviesCubit extends Cubit<RemoveFromWatchListMoviesState> {
  RemoveFromWatchListMoviesCubit(this._detailsRepo) : super(RemoveFromWatchListMoviesInitial());
  final DetailsRepo _detailsRepo;

  Future<void> removeFromWatchList() async {
    emit(RemoveFromWatchListMoviesLoading());
    var result = await _detailsRepo.removeFromWatchList();
    result.fold(
      (failure) => emit(RemoveFromWatchListMoviesFailure(failure.errorMessage)),
      (success) => emit(
        RemoveFromWatchListMoviesSuccess(),
      ),
    );
  }
}





