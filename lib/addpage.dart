//stful
import 'package:flutter/material.dart';
import 'package:flutter_application_p/TodoProvider.dart';
import 'package:flutter_application_p/Todoitem.dart';
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
              ElevatedButton(
                  onPressed: () {
                    var todo = TodoItem(
                        Uuid().v4(), _titleCon.text, _desCon.text, false);
                    todoProvider.insertTodo(todo);
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                    return;
                  },
                  child: Text("Add")),
            ],
          ),
        ));
  }
}
