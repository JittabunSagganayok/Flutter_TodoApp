//5. bloc ต้องการ state และ event โดยหน้านี้ bloc จะทำการผูกคำสั่งของ event กับ คำสั่งของ provider
import 'package:bloc/bloc.dart';
import 'package:flutter_application_p/TodoEvent.dart';
import 'package:flutter_application_p/TodoProvider.dart';
import 'package:flutter_application_p/TodoState.dart';
import 'package:flutter_application_p/Todoitem.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoProvider todoProvider = TodoProvider();
  TodoBloc() : super(InitialTodoSTate()) {
    List<TodoItem> todos = [];
    on<AddTodoEvent>((event, emit) async {
      await todoProvider.insertTodo(
          TodoItem(event.id, event.title, event.description, false));
    });
    on<UpdateTodoEvent>((event, emit) async {
      await todoProvider.updateTodo(event.item);
    });
    on<DeleteTodoEvent>((event, emit) async {
      await todoProvider.deleteTodo(event.item);
    });
    on<FetchTodoEvent>((event, emit) async {
      todos = await todoProvider.fetchTodos();
      emit(TodoListState(todos));
    });
  }
}
