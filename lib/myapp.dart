import 'package:flutter/material.dart';
import 'package:flutter_application_p/TodoProvider.dart';
import 'package:flutter_application_p/Todoitem.dart';
import 'package:sqflite/sqflite.dart';
import 'addpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF343A40),
            //secondary: const Color(0xFFFFC107),
          ),
          appBarTheme: const AppBarTheme(foregroundColor: Color(0xFFFF0000))),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // final List<String> entries = <String>['X', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];
  void clickadd() {
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => const addpage())).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: bodylist(),
      floatingActionButton: FloatingActionButton(
        onPressed: clickadd,
        //tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class bodylist extends StatefulWidget {
  bodylist({super.key});

  @override
  State<bodylist> createState() => _bodylistState();
}

class _bodylistState extends State<bodylist> {
  TodoProvider todoProvider = TodoProvider();
  Future<List<TodoItem>> fetchTodos() async {
    return await todoProvider.fetchTodos();
  }

  Future _onchangecheckbox(bool check, TodoItem item) async {
    TodoItem newItem = TodoItem(item.id, item.title, item.description, check);
    await todoProvider.updateTodo(newItem);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TodoItem>>(
        future: fetchTodos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoItem>> snapshot) {
          return ListView.builder(
              padding: const EdgeInsets.all(1),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                var todoItem = snapshot.data?[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                  ),
                  // secondaryBackground: ,
                  onDismissed: (direction) =>
                      todoProvider.deleteTodo(todoItem!),
                  child: ListTile(
                    leading: Checkbox(
                      value: todoItem?.done,
                      onChanged: (value) =>
                          {_onchangecheckbox(value ?? false, todoItem!)},
                    ),
                    title: Text(todoItem?.title ?? ""),
                    subtitle: Text(todoItem?.description ?? ""),
                  ),
                );
              });
        });
  }
}
