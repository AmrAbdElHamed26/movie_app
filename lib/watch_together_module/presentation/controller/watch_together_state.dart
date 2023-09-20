part of 'watch_together_bloc.dart';

class WatchTogetherState extends Equatable {
  final RequestState createRoomState;

  WatchTogetherState copyWith({RequestState? createRoomState}) {
    return WatchTogetherState(
      createRoomState: createRoomState ?? this.createRoomState,
    );
  }
  const WatchTogetherState({this.createRoomState = RequestState.loading});



  @override
  List<Object?> get props => [createRoomState];
}
