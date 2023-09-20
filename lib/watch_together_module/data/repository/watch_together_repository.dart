import 'package:movie_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/watch_together_module/data/data_source/watch_togehter_data_source.dart';
import 'package:movie_app/watch_together_module/domain/repository/base_watch_together_repository.dart';

class WatchTogetherRepository extends BaseWatchTogetherRepository{

  final BaseWatchTogetherDataSource baseWatchTogetherDataSource ;
  WatchTogetherRepository(this.baseWatchTogetherDataSource);

  @override
  Future<void> joinInterview(String roomID) {
    // TODO: implement joinInterview
    throw UnimplementedError();
  }

  @override
  Future<void> makeNewInterview(String roomID) async {
    await baseWatchTogetherDataSource.createRoom(roomID);
  }

}