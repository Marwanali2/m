import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marovies/features/details/data/repos/details_repo/details_repo.dart';
part 'add_to_watch_list_state.dart';

class AddToWatchListMoviesCubit extends Cubit<AddToWatchListMoviesState> {
  AddToWatchListMoviesCubit(this._detailsRepo) : super(AddToWatchListMoviesInitial());
  final DetailsRepo _detailsRepo;

  Future<void> addToWatchList() async {
    emit(AddToWatchListMoviesLoading());
    var result = await _detailsRepo.addToWatchList();
    result.fold(
      (failure) => emit(AddToWatchListMoviesFailure(failure.errorMessage)),
      (success) => emit(
        AddToWatchListMoviesSuccess(),
      ),
    );
  }
}





