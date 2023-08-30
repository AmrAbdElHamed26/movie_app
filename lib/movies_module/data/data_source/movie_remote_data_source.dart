import 'package:dio/dio.dart';
import 'package:movie_app/movies_module/data/models/movie_model.dart';
import 'package:movie_app/movies_module/domain/entities/movie_data.dart';
import 'package:movie_app/shared/error/exceptions.dart';
import 'package:movie_app/shared/network/api_constance.dart';
import 'package:movie_app/shared/network/error_network_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies ();

  Future<List<MovieModel>>getPopularMovies();

  Future<List<MovieModel>>getTopRatedMovies();
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
}