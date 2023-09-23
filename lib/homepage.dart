import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/box_dialog.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/todo_list.dart';

class homePage extends StatefulWidget {
  homePage({
    super.key,
  });

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _controller = TextEditingController();
  //  reference hive box
  final _box = Hive.box("mybox");
  database db = database();

  @override
  void initState() {
    // if it's the ever time to run this app
    if(_box.get("todolist") == null){
      db.createInitialData();
    }else{
      db.load();
    }
    super.initState();
  }

  // onchange method
  void checkboxchanged(bool? value, int index) {
    // if checkbox clicked
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.update();
  }

  // add new task to the list
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    db.update();
    Navigator.of(context).pop();
    _controller.text = "";
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }

// calling the dialog
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return boxDialog(
            controller: _controller,
            onsave: saveNewTask,
            oncencel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: const Text(
          "TO DO LIST",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) => toDoList(
                teskName: db.todoList[index][0],
                teskCompleted: db.todoList[index][1],
                onChanged: (value) => checkboxchanged(value, index),
                onPressed: (context) => deleteTask(index),
              )),
    );
  }
}
