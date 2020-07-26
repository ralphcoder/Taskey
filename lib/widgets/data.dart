import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'Task.dart';

class Data extends ChangeNotifier {
  List<Task> task = [Task(name: 'buy milk'), Task(name: 'buy bread')];

  void addtask(String newString) {
    final tasks = Task(name: newString);
    task.add(tasks);

    notifyListeners();
  }

  void update(int index) {
    task[index].toggleDone();
    notifyListeners();
  }

  void deletetask(int index) {
    task.removeAt(index);
    notifyListeners();
  }

//  _read() async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'my_task';
//    final value = prefs.getInt(key) ?? 0;
//    print('read: $value');
//  }
//
//  _save() async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'my_task';
//    final value = task;
//    prefs.setInt(key, value);
//    print('saved $value');
//  }
}
