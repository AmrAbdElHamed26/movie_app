import '../../movies_module/data/models/movie_model.dart';

SaveData appData = SaveData();
class SaveData{

   List<MovieModel> nowPlayingData = [];
   List<MovieModel> topRatedData = [];
   List<MovieModel> popularData = [];

  bool nowPlayingState = false , topRatedState = false , popularState = false;


}