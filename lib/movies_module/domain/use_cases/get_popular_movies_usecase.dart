import 'package:dartz/dartz.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';

import '../../../shared/error/failure.dart';

class GetPopularMoviesUseCase{
  final BaseMovieRepository baseMovieRepository ; // injection

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<MovieData>>> execute ()async{
    return await baseMovieRepository.getPopularMovies();
  }
}