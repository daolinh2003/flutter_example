
import 'package:flutter/material.dart';
import 'todo_detail.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todoList = List<Todo>.generate(
  20,
      (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i',
  ),
);


class TodoListScreen extends StatelessWidget {
  final List<Todo> todoList;

  //requiring the list of todoList
  TodoListScreen({required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(todoList[index].title),
            onTap: () {
              _gotoTodoDetailScreen(context, index);
            }
          );
        },
      ),
    );
  }

  void _gotoTodoDetailScreen(context, index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(todo: todoList[index]),
      ),
    );
  }
}
