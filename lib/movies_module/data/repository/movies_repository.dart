import 'package:dartz/dartz.dart';
import 'package:movie_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movie_app/shared/error/exceptions.dart';

import '../../../shared/error/failure.dart';
import '../models/movie_model.dart';

// implementation of functions in my contract (abstract class BaseMovieRepo)
class MoviesRepository extends BaseMovieRepository{

  // object from dataSource
  final BaseMovieRemoteDataSource _baseMovieRemoteDataSource ;

  MoviesRepository(this._baseMovieRemoteDataSource);


  @override
  Future<Either<Failure , List<MovieModel>>> getNowPlayingMovies()async {
    final result = await _baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorNetworkMessageError.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieData>>> getPopularMovies()async {
    final result = await _baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorNetworkMessageError.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieData>>> getTopRatedMovies()async {
    final result = await _baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorNetworkMessageError.statusMessage));
    }
  }


}