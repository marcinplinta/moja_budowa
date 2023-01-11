part of 'tasks_cubit.dart';

@immutable
class TasksState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;
  const TasksState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
