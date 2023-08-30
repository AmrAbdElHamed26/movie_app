class MovieData {
  final String backdropPath ;
  final List<int> genreIds ;
  final int id ;
  final String title;
  final String overview ;
  final double voteAverage;
  final String date ;


  const MovieData({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.date,
  });


  /*
  * can replace two overrides functions with equatable package
  * */

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieData &&
          runtimeType == other.runtimeType &&
          backdropPath == other.backdropPath &&
          genreIds == other.genreIds &&
          id == other.id &&
          title == other.title &&
          overview == other.overview &&
          voteAverage == other.voteAverage;


  @override
  int get hashCode =>
      backdropPath.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      title.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode;


}