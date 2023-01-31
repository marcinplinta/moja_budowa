import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_budowa/models/cost_model.dart';

class CostsRepository {
  Stream<List<CostModel>> getCostsStream() {
    return FirebaseFirestore.instance
        .collection('costs')
        .orderBy('date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return CostModel(
            // amount: doc['amount'] ,
            id: doc.id,
            title: doc['title'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('costs').doc(id).delete();
  }

  Future<void> add(
    String title,
    DateTime date,
    // double amount,
  ) async {
    {
      // throw Exception('Coś poszło nie tak');
      await FirebaseFirestore.instance.collection('costs').add(
        {
          'title': title,
          'date': date,
          // 'amount': amount,
        },
      );
    }
  }
}
