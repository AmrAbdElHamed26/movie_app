
import 'package:dartz/dartz.dart';
import 'package:movie_app/movies_module/domain/entities/recommendation.dart';

import '../../../shared/error/failure.dart';
import '../repository/base_movie_repository.dart';

class GetRecommendationUseCase {
  final BaseMovieRepository baseMovieRepository ; // injection
  GetRecommendationUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Recommendation>>> execute (int movieId)async{
    return await baseMovieRepository.getRecommendation( movieId);
  }
}