// part of 'now_playing_movies_cubit.dart';
// abstract class NowPlayingMoviesState extends Equatable {
//   const NowPlayingMoviesState();

//   @override
//   List<Object> get props => [];
// }

// class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

// class NowPlayingMoviesLoading extends NowPlayingMoviesState {}


// class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
//   final List<Result> nowPlayingMoviesList;

//    const NowPlayingMoviesSuccess(this.nowPlayingMoviesList);
// }

// class NowPlayingMoviesFailure extends NowPlayingMoviesState {
//   final String errorMessage;

//    const NowPlayingMoviesFailure(this.errorMessage);
// }
part of 'now_playing_movies_cubit.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<Result> nowPlayingMoviesList;
  final bool isLoadingMore;

  const NowPlayingMoviesSuccess(this.nowPlayingMoviesList, {this.isLoadingMore = false});

  @override
  List<Object> get props => [nowPlayingMoviesList, isLoadingMore];
}

class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errorMessage;

  const NowPlayingMoviesFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
