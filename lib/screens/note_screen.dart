import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context,
                title == null && description == null
                    ? null
                    : {
                        "title": title ?? "",
                        "description": description ?? "",
                      });
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(fontSize: 20),
              onChanged: (String? value) {
                title = value;
              },
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              onChanged: (String? value) {
                description = value;
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
