import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';
import 'package:todo_app/util/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // programatically adding a todo : STARTS
    // List<Todo> todos = List<Todo>();
    // DbHelper helper = DbHelper();

    // helper
    //     .initializeDb()
    //     .then((result) => helper.getTodos().then((result) => todos = result));

    // DateTime today = DateTime.now();

    // Todo todo = Todo("Watch Netflix", 3, today.toString(), "Money Heist");
    // var result = helper.insertTodo(todo);
    // programatically adding a todo : ENDS

    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}
