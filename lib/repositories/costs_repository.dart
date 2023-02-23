import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_budowa/models/cost_model.dart';

class CostsRepository {
  Stream<List<CostModel>> getCostsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Jesteś niezalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('costs')
        .orderBy('date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return CostModel(
            amount: int.parse(doc['amount'].toString()),
            id: doc.id,
            title: doc['title'],
            date: (doc['date'] as Timestamp).toDate(),
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
        .collection('costs')
        .doc(id)
        .delete();
  }

  Future<void> add(
    String title,
    DateTime date,
    int amount,
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
          .collection('costs')
          .add(
        {
          'title': title,
          'date': date,
          'amount': amount,
        },
      );
    }
  }
}
