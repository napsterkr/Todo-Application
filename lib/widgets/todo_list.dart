import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = BlocProvider.of<TodoBloc>(context).state.todoList;
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todoList[index];
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: todo.completed ? Colors.green : Colors.red,
                child: Text(
                  todo.id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                todo.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Completed: ${todo.completed}"),
            ),
          );
        });
  }
}
