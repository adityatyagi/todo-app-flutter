import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:todo_app/screens/todoDetail.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {
  // using db helper to fetch the data
  DbHelper helper = DbHelper();
  List<Todo> todos;

  // number of records in the todo table
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // when the screen loads for the first time, the todos list will be empty
    if (todos == null) {
      // instantiate the todo
      todos = List<Todo>();

      // fetch all todos
      getData();
    }

    // UI
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // for adding a new todo, we pass a new todo item with empty title, low priority and an empty date
          navigateToDetail(Todo('', 3, ''));
        },
        tooltip: "Add New Todo",
        child: new Icon(Icons.add),
      ),
    );
  }

  // returns a list view
  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          // itemBuilder takes a function which will be iterated for each item in the list
          // for each item in the list, we return a card
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.todos[position].priority),
                child: Text(this.todos[position].priority.toString()),
              ),
              title: Text(this.todos[position].title),
              subtitle: Text(this.todos[position].date),
              onTap: () {
                debugPrint("Tapped on " + this.todos[position].id.toString());
                navigateToDetail(this.todos[position]);
              },
            ),
          );
        });
  }

  // retrieve the data from the db
  void getData() {
    final dbFuture = helper.initializeDb(); // returns Future<Database>
    dbFuture.then((result) {
      // will retrieve all the todos from the table
      final todosFuture = helper.getTodos();

      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;

        for (int i = 0; i < count; i++) {
          // this will convert a simple object to a ToDo
          todoList.add(Todo.fromObject(result[i]));
        }

        // updating the widget's state
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  // different colors for different priorities
  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  // add/edit Todo - navigate to TodoDetail
  // called when we click on the list item
  // called when we click on Add Todo floating button
  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoDetail(todo)),
    );

    if (result == true) {
      getData();
    }
  }
}
