//stful
import 'package:flutter/material.dart';
import 'package:flutter_application_p/TodoEvent.dart';
import 'package:flutter_application_p/TodoProvider.dart';
import 'package:flutter_application_p/TodoState.dart';
import 'package:flutter_application_p/Todobloc.dart';
import 'package:flutter_application_p/Todoitem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _desCon = TextEditingController();

  TodoProvider todoProvider = TodoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add"),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleCon,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                controller: _desCon,
              ),
              BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
                return ElevatedButton(
                    onPressed: () async {
                      context.read<TodoBloc>().add(AddTodoEvent(
                          Uuid().v4(), _titleCon.text, _desCon.text));
                      context.read<TodoBloc>().add(FetchTodoEvent());
                      // var todo = TodoItem(
                      //     Uuid().v4(), _titleCon.text, _desCon.text, false);
                      // todoProvider.insertTodo(todo);
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                      return;
                    },
                    child: Text("Add"));
              })
            ],
          ),
        ));
  }
}
