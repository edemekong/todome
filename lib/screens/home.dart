import 'package:flutter/material.dart';
import 'package:todome/models/todo.dart';

import '../components/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todome"),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < todoList.length; index++) ...[
            TodoCard(
                onDelete: () {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
                todo: todoList[index]),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count = count + 1;

          final todo = Todo(
            id: "$count",
            title: "Hey $count",
            description: "descrioption $count",
            createdAt: DateTime.now(),
          );

          setState(() {
            todoList.add(todo);
          });

          print(todoList.length);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
