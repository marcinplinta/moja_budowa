import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:moja_budowa/models/task_model.dart';
import 'package:moja_budowa/repositories/tasks_repository.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this._tasksRepository)
      : super(TasksState(
          tasks: [],
          errorMessage: '',
          isLoading: false,
        ));

  final TasksRepository _tasksRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(TasksState(
      tasks: [],
      errorMessage: '',
      isLoading: true,
    ));
    _streamSubscription = _tasksRepository.getTasksStream().listen((tasks) {
      emit(
        TasksState(
          tasks: tasks,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          TasksState(
            tasks: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> remove({required String id}) async {
    try {
      await _tasksRepository.delete(id: id);
    } catch (error) {
      TasksState(
        tasks: const [],
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> add({required String title}) async {
    try {
      await _tasksRepository.add('title');
    } catch (error) {
      TasksState(
        tasks: const [],
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
