// 4. Provider คือ สร้างความสามารถในการกระทำกับ database Opendb,fetch,insert,update,delete (CRUD)
// db ใช้ package sqflite

import 'package:flutter_application_p/Todoitem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoProvider {
  static const todoItemTable = 'TodoItemTable';
//ของ SKOOLDIO
  Future<List<TodoItem>> fetchTodos() async {
    Database db = await database();
    List<Map<dynamic, dynamic>> todos = await db.query(todoItemTable);
    return todos.map((e) => TodoItem.fromMap(e)).toList();
  }

  Future<Database> database() async {
    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'todo_item.db');
    // //await deleteDatabase(path);
    // Database database = await openDatabase(
    //   path,
    //   version: 1,
    return await openDatabase(
      join(await getDatabasesPath(), 'todo_item.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            // 'CREATE TABLE ${todoItemTable}
            // (id TEXT PRIMARY KEY , title TEXT , description TEXT , checkbox INTEGER,)'

            "CREATE TABLE ${todoItemTable} ("
            "id TEXT PRIMARY KEY, "
            "title TEXT, "
            "description TEXT, "
            "done INTEGER )");
      },
    );

    //return database;
  }

  //insert
  Future<void> insertTodo(TodoItem item) async {
    Database db = await database();
    await db.insert(
      todoItemTable,
      item.toMap(),
    );
  }

  Future<void> updateTodo(TodoItem update) async {
    Database db = await database();
    db.update(todoItemTable, update.toMap(),
        where: 'id = ?', whereArgs: [update.id]);
  }

  Future<void> deleteTodo(TodoItem delete) async {
    Database db = await database();
    db.delete(todoItemTable, where: 'id = ?', whereArgs: [delete.id]);
  }

  // Database? db;

  // //OPEN
  // Future<void> open(String path) async {
  //   db = await openDatabase(path, version: 1,
  //       onCreate: (Database db, int version) async {
  //     await db.execute(
  //         'CREATE TABLE TodoItemTable (id INTEGER PRIMARY KEY,title TEXT,description TEXT,checkbox INTEGER)');
  //   });
  // }

  // //CLOSE
  // Future close() async => db!.close();

  // //fetch
  // Future<TodoItem?> getTodo() async {
  //   List<Map> maps = await db!.query("TodoItenTable");
  //   if (maps.length > 0) {
  //     //return TodoItem.fromMap(maps.first);
  //     return TodoItem.fromMap(maps.first);
  //   }
  //   return null;
  // }

  // //insert
  // Future<TodoItem> insert(item) async {
  //   item.id = await db!.insert('TodoItenTable', item.toMap());
  //   return item;
  // }
}
