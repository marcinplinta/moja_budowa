import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moja_budowa/models/event_model.dart';

class EventsRepository {
  Stream<List<EventModel>> getEventsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Jesteś niezalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
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
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Jesteś niezalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('events')
        .doc(id)
        .delete();
  }

  Future<void> add(
    String title,
    DateTime releaseDate,
    TimeOfDay releaseTime,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Jesteś niezalogowany');
    }
    {
      // throw Exception('Coś poszło nie tak');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('events')
          .add(
        {
          'title': title,
          'release_date': DateTime(
            releaseDate.year,
            releaseDate.month,
            releaseDate.day,
            releaseTime.hour,
            releaseTime.minute,
          )
        },
      );
    }
  }
}
