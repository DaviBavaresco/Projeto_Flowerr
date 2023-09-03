import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('PRANCHA ISOMÉTRICA', 1, 10),
    Task('AGACHAMENTO', 3, 10),
    Task('PRANCHA ISOMÉTRICA',2,10),
    Task('FLEXÃO DE BRAÇOS COM APOIO DO JOELHO',3,5),
    Task('CRUNCH',3,10),
    Task('JUMPING JACK', 5, 5),
  ];

  void newTask(String name, int  seriee, int repetion){
    taskList.add(Task(name, seriee, repetion));
  }
  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
