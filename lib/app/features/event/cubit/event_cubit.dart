import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_budowa/models/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('events')
        .orderBy('release_date')
        .snapshots()
        .listen(
      (events) {
        final eventModels = events.docs.map((doc) {
          return EventModel(
            id: doc.id,
            title: doc['title'],
            releaseDate: (doc['release_date'] as Timestamp).toDate(),
          );
        }).toList();
        emit(EventState(events: eventModels));
      },
    )..onError(
        (error) {
          emit(const EventState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const EventState(removingErrorOccured: true),
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
