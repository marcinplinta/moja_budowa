part of 'event_cubit.dart';

class EventState {
  const EventState({
    this.events,
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final QuerySnapshot<Map<String, dynamic>>? events;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
