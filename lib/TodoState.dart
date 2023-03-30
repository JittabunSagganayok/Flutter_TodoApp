import 'package:flutter_application_p/Todoitem.dart';

abstract class TodoState {
  TodoState();
}

class InitialTodoSTate extends TodoState {}

class TodoListState extends TodoState {
  List<TodoItem> todos;
  TodoListState(this.todos);
}
