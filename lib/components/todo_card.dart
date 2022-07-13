import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onDelete;

  const TodoCard({
    Key? key,
    required this.onDelete,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.description),
          const SizedBox(height: 8),
          Text(
            todo.createdAt.toIso8601String(),
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
      trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
    );
  }
}
