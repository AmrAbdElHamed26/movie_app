
import 'package:movie_app/watch_together_module/domain/repository/base_watch_together_repository.dart';

class CreateMeetingUseCase{
  BaseWatchTogetherRepository baseWatchTogetherRepository;
  CreateMeetingUseCase(this.baseWatchTogetherRepository);

  Future<void> execute(String roomID)async {
    await baseWatchTogetherRepository.makeNewInterview(roomID);

  }
}