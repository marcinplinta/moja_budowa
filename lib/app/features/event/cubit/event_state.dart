part of 'event_cubit.dart';

class EventState {
  EventState({
    this.events = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<EventModel> events;
  final Status status;
  final String? errorMessage;
}
