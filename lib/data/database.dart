

import 'package:hive_flutter/hive_flutter.dart';

class database {
  var todoList = [];
  final _box = Hive.box("mybox");

// create new task if it's the first time ever opening the app
  void createInitialData(){
    todoList = [
      ["make your own time table", false]
    ];
  }

// displaying data if the user open the app
  void load(){
    todoList = _box.get("todolist");
  }

  // updating if there is change

  void update(){
    _box.put("todolist", todoList);
  }
}