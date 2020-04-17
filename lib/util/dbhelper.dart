import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/model/todo.dart';

class DbHelper {
  // creating this as a singleton
  static final DbHelper _dbHelper = DbHelper._internal();

  // named constructor
  DbHelper._internal();

  // unnamed/default constructor
  factory DbHelper() {
    // return the named constructor
    return _dbHelper;
  }

  // tblTodo = table name
  String tblTodo = "todo";

  // column names
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  // Create or Open DB
  Future<Database> initializeDb() async {
    // Directory: from IO package
    // getApplicationDocumentsDirectory(): from path_provider
    Directory dir = await getApplicationDocumentsDirectory();

    // the paths are diff for iOS and Android but this handles that
    String path = dir.path + 'todos.db';

    // if the todos db is not already present, run onCreate which will create the db
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);

    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  // this variable will hold the DB throughout the app (static)
  static Database _db;

  // getter
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  // add todo
  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  // get all todos
  Future<List> getTodos() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT  * FROM $tblTodo order by $colPriority ASC");
    return result;
  }

  // get total number of todos
  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT count (*) from $tblTodo"));
    return result;
  }

  // update todo
  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  // delete todo
  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("DELETE FROM $tblTodo WHERE $colId = $id");
    return result;
  }
}
