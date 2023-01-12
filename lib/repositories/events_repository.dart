import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_budowa/models/event_model.dart';

class EventsRepository {
  Stream<List<EventModel>> getEventsStream() {
    return FirebaseFirestore.instance
        .collection('events')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return EventModel(
            id: doc.id,
            title: doc['title'],
            releaseDate: (doc['release_date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('events').doc(id).delete();
  }

  Future<void> add(
    String title,
    DateTime releaseDate,
  ) async {
    {
      // throw Exception('Coś poszło nie tak');
      await FirebaseFirestore.instance.collection('events').add(
        {
          'title': title,
          'release_date': releaseDate,
        },
      );
    }
  }
}
