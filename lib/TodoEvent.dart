import 'package:flutter_application_p/Todoitem.dart';

abstract class TodoEvent {
  TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  String id;
  String title;
  String description;
  AddTodoEvent(this.id, this.description, this.title);
}

class UpdateTodoEvent extends TodoEvent {
  TodoItem item;
  UpdateTodoEvent(this.item);
}

class DeleteTodoEvent extends TodoEvent {
  TodoItem item;
  DeleteTodoEvent(this.item);
}

class FetchTodoEvent extends TodoEvent {
  FetchTodoEvent();
}
