import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_budowa/data/category_remote_data_source.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/models/expenses_model.dart';

class CategoryRepository {
  CategoryRepository(this.categoryRemoteDataSources);
  final CategoryRemoteDataSources categoryRemoteDataSources;

  Future<List<CategoryModel>> getCategories() async {
    return categoryRemoteDataSources.getCategories();
  }

  Future<CategoryModel> getCategory({required String id}) async {
    return categoryRemoteDataSources.getCategory(id: id);
  }

  Future<List<ExpensesModel>> getExpenses({
    required String categoryId,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return categoryRemoteDataSources.getExpenses(categoryId: categoryId);
  }

  // Stream<List<ExpensesModel>> getExpensesStream({
  //   required String categoryId,
  // }) {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   return categoryRemoteDataSources.getExpensesStream(categoryId: categoryId);
  // }

  Future<void> deleteExpenses({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return categoryRemoteDataSources.deleteExpenses(id: id);
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
    return categoryRemoteDataSources.addExpenses(
      title,
      date,
      amount,
      categoryId,
    );
  }

  Future<ExpensesModel> getDetalisExpenses({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return categoryRemoteDataSources.getDetalisExpenses(id: id);
  }
}
