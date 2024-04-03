

import 'package:flutter/material.dart';
import 'package:untitled1/components/task.dart';

class TaskInherited extends InheritedWidget {

    TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    const Task(name: 'jogar lixo fora', difficulty: 2, pictureLink: 'assets/images/trash_out.png'),
    const Task(name: 'nome da tarefa', difficulty: 1, pictureLink: ''),
    const Task(name: 'nome da tarefa', difficulty: 5, pictureLink: ''),
    const Task(name: 'nome da tarefa', difficulty: 4, pictureLink: ''),
    const Task(name: 'nome da tarefa', difficulty: 4, pictureLink: ''),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name: name, difficulty: difficulty, pictureLink: photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaksInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

}
