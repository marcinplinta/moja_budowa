import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/event_model.dart';
import 'package:moja_budowa/repositories/events_repository.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this._eventsRepository) : super(EventState());

  final EventsRepository _eventsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _eventsRepository.getEventsStream().listen(
      (events) {
        emit(
          EventState(
            events: events,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            EventState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _eventsRepository.delete(id: documentID);
    } catch (error) {
      emit(
        EventState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
