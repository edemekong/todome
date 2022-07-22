import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback ontTap;

  const NoteCard({
    Key? key,
    required this.onDelete,
    required this.note,
    required this.ontTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontTap,
      title: Text(note.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.description),
          const SizedBox(height: 8),
          Text(
            note.createdAt.toIso8601String(),
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
      trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
    );
  }
}
