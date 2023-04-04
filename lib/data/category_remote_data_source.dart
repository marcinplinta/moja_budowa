import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/models/expenses_model.dart';

class CategoryRemoteDataSources {
  Future<List<CategoryModel>> getCategories() async {
    final doc = await FirebaseFirestore.instance
        .collection('categories')
        .orderBy(
          'title',
          // descending: true,
        )
        .get();

    return doc.docs.map((doc) {
      return (CategoryModel(
        id: doc.id,
        title: doc['title'],
      ));
    }).toList();
  }

  Future<CategoryModel> getCategory({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('categories').doc(id).get();
    return CategoryModel(
      id: doc.id,
      title: doc['title'],
    );
  }

  Future<List<ExpensesModel>> getExpenses({
    required String categoryId,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        // .orderBy('date')
        .where('category_id', isEqualTo: categoryId)
        .get();

    return doc.docs.map((doc) {
      return (ExpensesModel(
        id: doc.id,
        title: doc['title'],
        date: (doc['date'] as Timestamp).toDate(),
        amount: int.parse(doc['amount'].toString()),
        categoryId: doc['category_id'],
      ));
    }).toList();
  }

  Future<void> deleteExpenses({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .doc(id)
        .delete();
  }

  Future<void> addExpenses(
    String title,
    DateTime date,
    int amount,
    String categoryId,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .add({
      'title': title,
      'category_id': categoryId,
      'date': date,
      'amount': amount,
    });
  }

  Future<ExpensesModel> getDetalisExpenses({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .doc(id)
        .get();
    return ExpensesModel(
      id: doc.id,
      amount: int.parse(doc['amount'].toString()),
      title: doc['title'],
      date: (doc['date'] as Timestamp).toDate(),
      categoryId: doc['category_id'],
    );
  }
}
