part of 'watch_list_movies_cubit.dart';
abstract class WatchListMoviesState extends Equatable {
  const WatchListMoviesState();

  @override
  List<Object> get props => [];
}

class WatchListMoviesInitial extends WatchListMoviesState {}

class WatchListMoviesLoading extends WatchListMoviesState {}


class WatchListMoviesSuccess extends WatchListMoviesState {
  final List<MovieWatchListResult> watchListMovies;

   const WatchListMoviesSuccess(this.watchListMovies);
}

class WatchListMoviesFailure extends WatchListMoviesState {
  final String errorMessage;

   const WatchListMoviesFailure(this.errorMessage);
}
