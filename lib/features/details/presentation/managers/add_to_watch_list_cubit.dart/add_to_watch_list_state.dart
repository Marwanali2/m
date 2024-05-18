part of 'add_to_watch_list_cubit.dart';
abstract class AddToWatchListMoviesState extends Equatable {
  const AddToWatchListMoviesState();

  @override
  List<Object> get props => [];
}

class AddToWatchListMoviesInitial extends AddToWatchListMoviesState {}

class AddToWatchListMoviesLoading extends AddToWatchListMoviesState {}


class AddToWatchListMoviesSuccess extends AddToWatchListMoviesState {}

class AddToWatchListMoviesFailure extends AddToWatchListMoviesState {
  final String errorMessage;

   const AddToWatchListMoviesFailure(this.errorMessage);
}
