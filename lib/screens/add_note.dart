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

  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
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
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(text: widget.note?.title),
            style: const TextStyle(fontSize: 20),
            onChanged: (String? value) {
              title = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: "Title",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 20),
            ),
            onSubmitted: (value) {
              myFocusNode.requestFocus();
            },
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TextField(
              focusNode: myFocusNode,
              onTap: () {
                if (myFocusNode.hasFocus) {
                  myFocusNode.unfocus();
                } else {
                  myFocusNode.requestFocus();
                }
              },
              controller: TextEditingController(text: widget.note?.description),
              onChanged: (String? value) {
                description = value!;
              },
              maxLines: null,
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                hintText: "Write something...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
