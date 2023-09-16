import 'package:dartz/dartz.dart';
import 'package:movie_app/movies_module/data/models/movie_details_model.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';

import '../../../shared/error/failure.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUseCase{
  BaseMovieRepository baseMovieRepository ;
  GetMovieDetailsUseCase(this.baseMovieRepository);

  Future<Either<Failure , MovieDetail>> execute (int movieDetailsID)async{
    return await baseMovieRepository.getMovieDetails(movieDetailsID);
  }
}