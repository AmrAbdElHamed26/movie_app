import 'package:dio/dio.dart';
import 'package:movie_app/movies_module/data/models/movie_model.dart';
import 'package:movie_app/movies_module/data/models/recommendation_model.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';
import 'package:movie_app/shared/error/exceptions.dart';
import 'package:movie_app/shared/network/api_constance.dart';
import 'package:movie_app/shared/network/error_network_message_model.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies ();

  Future<List<MovieModel>>getPopularMovies();

  Future<List<MovieModel>>getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(int movieDetailsID);

  Future<List<RecommendationModel>> getRecommendation(int movieDetailsID);
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{

    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorNetworkMessageError: ErrorNetworkMessageError.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorNetworkMessageError: ErrorNetworkMessageError.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviePath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorNetworkMessageError: ErrorNetworkMessageError.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieDetailsID) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(movieDetailsID));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(errorNetworkMessageError: ErrorNetworkMessageError.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(int movieDetailsID)async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(movieDetailsID));
    if(response.statusCode == 200){
      return  List<RecommendationModel>.from((response.data["results"]as List).map((e) => RecommendationModel.fromJson(e)));

    }
    else{
      throw ServerException(errorNetworkMessageError: ErrorNetworkMessageError.fromJson(response.data));
    }
  }
}