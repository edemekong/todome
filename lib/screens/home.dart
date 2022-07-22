import 'package:flutter/material.dart';
import 'package:todome/models/note.dart';
import 'package:todome/screens/add_note.dart';

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
          for (int index = 0; index < noteList.length; index++) ...<Widget>[
            NoteCard(
                ontTap: () {
                  Navigator.push<Note>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNoteScreen(
                                note: noteList[index],
                              ))).then(
                    (value) {
                      if (value != null) {
                        final index = noteList.indexWhere((note) => note.id == value.id);
                        setState(() {
                          noteList.removeAt(index);
                          noteList.insert(index, value);
                        });
                      }
                    },
                  );
                },
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
          Navigator.push<Note>(context, MaterialPageRoute(builder: (context) => const AddNoteScreen())).then(
            (value) {
              if (value != null) {
                setState(() {
                  noteList.add(value);
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
