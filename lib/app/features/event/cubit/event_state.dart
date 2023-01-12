part of 'event_cubit.dart';

class EventState {
  const EventState({
    this.events = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<EventModel> events;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
