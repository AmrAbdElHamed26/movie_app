import 'dart:async';

import 'package:movie_app/movies_module/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movie_app/movies_module/presentation/controller/movies_events.dart';
import 'package:movie_app/movies_module/presentation/controller/movies_states.dart';
import 'package:bloc/bloc.dart';
import 'package:movie_app/shared/utils/enums.dart';

import '../../domain/use_cases/get_popular_movies_usecase.dart';
import '../../domain/use_cases/get_top_rated_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {

    on<GetNowPlayingMoviesEvent>(_getNowPlaying);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

  }

  FutureOr<void> _getNowPlaying(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingMoviesUseCase.execute();

    result.fold(
            (l) => emit(MoviesState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message)),
            (r) => emit(MoviesState(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase.execute();

    result.fold(
            (l) => emit(
            state.copyWith(popularState: RequestState.error, popularMessage: l.message)
        ),
            (r) => emit(
            state.copyWith(popularState: RequestState.loaded, popularMovies: r)
        ));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
            (l) => emit(
            state.copyWith(topRatedState: RequestState.error, topRatedMessage: l.message)
        ),
            (r) => emit(
            state.copyWith(topRatedState: RequestState.loaded, topRatedMovies: r)
        ));
  }
}
