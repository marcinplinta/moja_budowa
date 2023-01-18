part of 'tasks_cubit.dart';

class TasksState {
  TasksState({
    this.tasks = const [],
    required this.isLoading,
    required this.errorMessage,
  });
  final List<TaskModel> tasks;
  final bool isLoading;
  final String errorMessage;
}
