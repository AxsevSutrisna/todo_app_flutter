import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_detail.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => TodoDetailDialog(todo: todo),
        );
      },
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          ref.read(todoProvider.notifier).toggleTodo(todo.id);
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          ref.read(todoProvider.notifier).deleteTodo(todo.id);
        },
      ),
    );
  }
}
