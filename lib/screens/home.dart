import 'package:flutter/material.dart';
import 'package:todome/models/note.dart';
import 'package:todome/screens/note_screen.dart';

import '../components/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  List<Note> noteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todome"),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < noteList.length; index++) ...[
            NoteCard(
                onDelete: () {
                  setState(() {
                    noteList.removeAt(index);
                  });
                },
                note: noteList[index]),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Map<String, dynamic>>(context, MaterialPageRoute(builder: (context) => const NoteScreen()))
              .then(
            (value) {
              if (value != null) {
                final title = value["title"];
                final description = value["description"];

                final newNote = Note(
                  id: DateTime.now().toIso8601String(),
                  title: title,
                  description: description,
                  createdAt: DateTime.now(),
                );

                setState(() {
                  noteList.add(newNote);
                });
              }
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

sum() => 1 + 2;
