import 'package:dartz/dartz.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';
import 'package:movie_app/movies_module/domain/entities/recommendation.dart';
import 'package:movie_app/shared/error/failure.dart';

import '../entities/movie_details.dart';

// my contract
abstract class BaseMovieRepository {
  Future<Either<Failure,List<MovieData>>> getNowPlayingMovies();
  Future<Either<Failure,List<MovieData>>> getPopularMovies();
  Future<Either<Failure,List<MovieData>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetails(int movieDetailsID);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(int movieId);
}