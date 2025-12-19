import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';
import '../widgets/add_todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final progress = ref.watch(todoProgressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Progress'),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: progress, minHeight: 8),
                const SizedBox(height: 4),
                Text('${(progress * 100).toInt()}% selesai'),
              ],
            ),
          ),

          Expanded(
            child: todos.isEmpty
                ? const Center(child: Text('Belum ada Task'))
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return TodoItem(todo: todos[index]);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showDialog(context: context, builder: (_) => const AddTodo()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
