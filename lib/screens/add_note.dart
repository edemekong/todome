import 'package:flutter/material.dart';

import '../models/note.dart';

class AddNoteScreen extends StatefulWidget {
  final Note? note;
  const AddNoteScreen({Key? key, this.note}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<AddNoteScreen> {
  String title = "";
  String description = "";

  @override
  void initState() {
    title = widget.note?.title ?? "";
    description = widget.note?.description ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note != null ? "Edit Note" : "Create Note"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            bool checkIfTitleContainsValueAndDescriptionDoesNot = title.isNotEmpty && description.isEmpty;
            bool checkIfDescriptionContainsValueAndTitleDoesNot = description.isNotEmpty && title.isEmpty;
            bool checkIfBothTitleAndDescriptionContainsValue = title.isNotEmpty && description.isNotEmpty;

            if (checkIfTitleContainsValueAndDescriptionDoesNot ||
                checkIfDescriptionContainsValueAndTitleDoesNot ||
                checkIfBothTitleAndDescriptionContainsValue) {
              final oldNote = widget.note;
              final newNote = Note(
                id: oldNote != null ? oldNote.id : DateTime.now().toIso8601String(),
                title: title,
                description: description,
                createdAt: oldNote != null ? oldNote.createdAt : DateTime.now(),
              );

              Navigator.pop(context, newNote);
            } else {
              Navigator.pop(context, null);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: widget.note?.title),
              style: const TextStyle(fontSize: 20),
              onChanged: (String? value) {
                title = value!;
              },
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: TextEditingController(text: widget.note?.description),
              onChanged: (String? value) {
                description = value!;
              },
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Write something...",
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
