import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_budowa/models/cost_model.dart';

class CostsRepository {
  Stream<List<CostModel>> getCostsStream() {
    return FirebaseFirestore.instance
        .collection('costs')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return CostModel(
            // amount: doc['amount'] ,
            id: doc.id,
            title: doc['title'],
            releaseDate: (doc['release_date'] as Timestamp).toDate(),
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
    DateTime releaseDate,
    // double amount,
  ) async {
    {
      // throw Exception('Coś poszło nie tak');
      await FirebaseFirestore.instance.collection('costs').add(
        {
          'title': title,
          'release_date': releaseDate,
          // 'amount': amount,
        },
      );
    }
  }
}
