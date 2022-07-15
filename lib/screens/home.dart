import 'package:flutter/material.dart';
import 'package:todome/models/note.dart';

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
          count = count + 1;

          final note = Note(
            id: "$count",
            title: "Hey $count",
            description: "descrioption $count",
            createdAt: DateTime.now(),
          );

          setState(() {
            noteList.add(note);
          });

          print(noteList.length);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
