import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../models/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy sheep'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasksList);
  }

  int get tasksLength => _tasksList.length;

  void deleteTaks(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }

  void addTast(String name) {
    _tasksList.add(Task(name: name));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
