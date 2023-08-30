import 'package:equatable/equatable.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';

import '../../../shared/utils/enums.dart';

class MoviesState extends Equatable {
  /// nowPlaying Data
  final List<MovieData> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  /// popular Data
  final List<MovieData> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  ///top rated data
  final List<MovieData> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  // use copyWith to avoid removing data from the previous object , if the previous object have data take it and use it in the new object
  MoviesState copyWith({
    List<MovieData>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    /// popular Data
    List<MovieData>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    /// top rated data
    List<MovieData>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,

  }) {
    return MoviesState(
      /// now playing data
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      /// popular data
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      ///top rated data
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",

    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",

    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = "",
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
