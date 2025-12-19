import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../models/todo.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [];

  void addTodo(String title, String description) {
    final newTodo = Todo(
      id: Random().nextDouble().toString(),
      title: title,
      description: description,
    );

    state = [...state, newTodo];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new,
);

final todoProgressProvider = Provider<double>((ref) {
  final todos = ref.watch(todoProvider);

  if (todos.isEmpty) return 0.0;

  final completed = todos.where((todo) => todo.isCompleted).length;

  return completed / todos.length;
});
