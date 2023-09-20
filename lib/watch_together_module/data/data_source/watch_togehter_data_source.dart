import '../../../shared/services/jitsi_meet_methods.dart';

abstract class BaseWatchTogetherDataSource{

  Future<void> createRoom(String room);
}


class WatchTogetherRemoteDataSource extends BaseWatchTogetherDataSource{
  final JitsiMeetMethods jitsiMeetMethods = JitsiMeetMethods();


  @override
  Future<void> createRoom(String room) async {
    await jitsiMeetMethods.createMeeting(roomName: room);
  }

}