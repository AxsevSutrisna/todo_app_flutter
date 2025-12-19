import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoDetailDialog extends StatelessWidget {
  final Todo todo;

  const TodoDetailDialog({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Detail Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(todo.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),

          /// DESCRIPTION
          Text(
            todo.description.isNotEmpty
                ? todo.description
                : 'Tidak ada deskripsi',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Tutup'),
        ),
      ],
    );
  }
}
