import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/taskpage/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void toggleCompletion(int index) {
    final task = state[index];
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Task(
            title: task.title,
            note: task.note,
            dateTime: task.dateTime,
            category: task.category,
            isCompleted: !task.isCompleted,
          )
        else
          state[i],
    ];
  }

  void deleteTask(int index) {
    state = List.from(state)..removeAt(index);
  }

  void addTask(Task task) {
    state = [...state, task];
  }

  void updateTask(int index, Task updatedTask) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updatedTask else state[i],
    ];
  }
}
