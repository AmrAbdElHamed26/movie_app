class ApiConstance {
  static const String baseMovieUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "a409320b12d778cbaf0222f8a807c668";
  static const String nowPlayingMoviePath = "$baseMovieUrl/movie/now_playing?api_key=$apiKey";
  static const String topRatedMoviePath = "$baseMovieUrl/movie/top_rated?api_key=$apiKey";
  static const String popularMoviePath = "$baseMovieUrl/movie/popular?api_key=$apiKey";

  static const String basePicturesPath = "https://image.tmdb.org/t/p/w500";
  static imageUrl(String s) => "$basePicturesPath$s";

}