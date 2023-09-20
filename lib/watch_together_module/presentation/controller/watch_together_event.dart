part of 'watch_together_bloc.dart';

abstract class WatchTogetherEvent extends Equatable {
  const WatchTogetherEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateRoomEvent extends WatchTogetherEvent{

  String roomID;
  CreateRoomEvent(this.roomID);


}