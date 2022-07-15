import 'package:flutter/material.dart';
import 'package:todome/screens/home.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Favor",
      home: HomeScreen(),
    );
  }
}
