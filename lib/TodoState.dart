//2.bloc ต้องการ state และ event
//สร้าง class สำหรับ state 1.initstate 2.liststate

import 'package:flutter_application_p/Todoitem.dart';

abstract class TodoState {
  TodoState();
}

class InitialTodoSTate extends TodoState {}

class TodoListState extends TodoState {
  List<TodoItem> todos;
  TodoListState(this.todos);
}
