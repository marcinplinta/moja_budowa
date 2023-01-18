import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_budowa/models/task_model.dart';

class TasksRepository {
  Stream<List<TaskModel>> getTasksStream() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return TaskModel(
          id: doc.id,
          title: doc['title'],
        );
      }).toList();
    });
  }

  Future<void> delete({required String id}) async {
    return FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }

  Future<void> add(String title) async {
    await FirebaseFirestore.instance.collection('tasks').add(
      {
        'title': title,
      },
    );
  }
}
