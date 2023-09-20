import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/utils/enums.dart';
import '../../domain/use_cases/create_meeting_use_case.dart';

part 'watch_together_event.dart';
part 'watch_together_state.dart';

class WatchTogetherBloc extends Bloc<WatchTogetherEvent, WatchTogetherState> {

  final CreateMeetingUseCase createMeetingUseCase ;

  WatchTogetherBloc(this.createMeetingUseCase) : super(const WatchTogetherState()) {
    on<CreateRoomEvent>((event, emit) {

      createMeetingUseCase.execute(event.roomID) ;

      emit(state.copyWith(createRoomState: RequestState.loaded));

    });
  }
}
