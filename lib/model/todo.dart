class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // default constructor - will help to define a todo when it is made for the first time without an id.
  Todo(this._title, this._priority, this._date, [this._description]);

  // named constructor - you can have only 1 unnamed/default constructor, will help to define a ToDo when it is used for Edit.
  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);

  // named constructor - do the opposite of the toMap() i.e we take in an object and transform it in a todo.
  // "this" will be the object this constructor is called on
  Todo.fromObject(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._description = obj["description"];
    this._priority = obj["priority"];
    this._date = obj["date"];
  }

  // getters
  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  // setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }
}
