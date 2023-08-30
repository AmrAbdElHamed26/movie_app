import 'package:movie_app/movies_module/domain/entities/movie_data.dart';

class MovieModel extends MovieData {
  MovieModel(
      {required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.date});


  factory MovieModel.fromJson(json)=>MovieModel(
    backdropPath : json["backdrop_path"],
    genreIds : List<int>.from(json["genre_ids"].map((e)=>e)),
    id :json["id"],
    title:json["title"],
    overview:json["overview"],
    voteAverage:json["vote_average"].toDouble(),
    date:json["release_date"],

  );
}
