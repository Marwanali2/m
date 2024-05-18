part of 'remove_from_watch_list_cubit.dart';
abstract class RemoveFromWatchListMoviesState extends Equatable {
  const RemoveFromWatchListMoviesState();

  @override
  List<Object> get props => [];
}

class RemoveFromWatchListMoviesInitial extends RemoveFromWatchListMoviesState {}

class RemoveFromWatchListMoviesLoading extends RemoveFromWatchListMoviesState {}


class RemoveFromWatchListMoviesSuccess extends RemoveFromWatchListMoviesState {}

class RemoveFromWatchListMoviesFailure extends RemoveFromWatchListMoviesState {
  final String errorMessage;

   const RemoveFromWatchListMoviesFailure(this.errorMessage);
}
