import 'package:get_it/get_it.dart';
import 'package:movie_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies_module/data/repository/movies_repository.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies_module/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app/movies_module/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movie_app/movies_module/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies_module/domain/use_cases/get_top_rated_usecase.dart';
import 'package:movie_app/movies_module/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movie_app/watch_together_module/data/data_source/watch_togehter_data_source.dart';
import 'package:movie_app/watch_together_module/data/repository/watch_together_repository.dart';
import 'package:movie_app/watch_together_module/domain/repository/base_watch_together_repository.dart';
import 'package:movie_app/watch_together_module/presentation/controller/watch_together_bloc.dart';

import '../../movies_module/domain/use_cases/get_recommedation_use_case.dart';
import '../../watch_together_module/domain/use_cases/create_meeting_use_case.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    ///blocs
    getIt.registerFactory(()=>MoviesBloc(getIt() , getIt() , getIt()));
    getIt.registerFactory(()=>MovieDetailsBloc(getIt() , getIt()));
    getIt.registerFactory(()=>WatchTogetherBloc(getIt() ));


    ///DATA SOURCE
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    getIt.registerLazySingleton<BaseWatchTogetherDataSource>(() => WatchTogetherRemoteDataSource());


    ///REPOSITORY
    getIt.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(getIt()));

    getIt.registerLazySingleton<BaseWatchTogetherRepository>(() => WatchTogetherRepository(getIt()));


    ///USE CASE
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));

    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt()));

    getIt.registerLazySingleton(() => CreateMeetingUseCase(getIt()));





  }
}
