
import 'package:movie_app/watch_together_module/domain/repository/base_watch_together_repository.dart';

class CreateMeetingUseCase{
  BaseWatchTogetherRepository baseWatchTogetherRepository;
  CreateMeetingUseCase(this.baseWatchTogetherRepository);

  Future<void> execute()async {
    await baseWatchTogetherRepository.makeNewInterview();
  }
}