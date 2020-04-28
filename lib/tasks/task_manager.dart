import 'dart:math';
import 'task.dart';

class TaskManager {

  // todo: add more tasks
  List<Task> _taskDataLevel1 = [
    Task(
        taskTitle: 'Dish Master',
        taskDescription: 'Do the dishes',
        taskPoint: 100,
        taskLevel: 1
    ),
    Task(
      taskTitle: 'Clean Dude',
      taskDescription: 'Have a shower and groom',
      taskPoint: 150,
      taskLevel: 1
    ),
    Task(
      taskTitle: 'Roadrunner',
      taskDescription: 'Go for a 30 minutes jog',
      taskPoint: 300,
      taskLevel: 1
    ),
    Task(
        taskTitle: 'Smart cat',
        taskDescription: 'Do 1 hour on a project',
        taskPoint: 300,
        taskLevel: 1
    )

  ];

  List<Task> _taskDataLevel2 = [
    Task(
        taskTitle: 'Cool guy',
        taskDescription: 'Clean your fridge',
        taskPoint: 300,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Fashion connoisuer',
        taskDescription: 'Try a new style',
        taskPoint: 150,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Champion',
        taskDescription: 'Go for a 1 hour jog',
        taskPoint: 350,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Educator',
        taskDescription: 'Do 2 hours on a project',
        taskPoint: 350,
        taskLevel: 2
    )
  ];

  // randomize integer within the bounds of the array length
  int randomTaskNum() {
    int _taskNumber = _taskDataLevel1.length;
    return (new Random().nextInt(_taskNumber));
  }

  String getTaskTitle() {
    return _taskDataLevel1[randomTaskNum()].taskTitle;
  }

  String getTaskDescription() {
    return _taskDataLevel1[randomTaskNum()].taskDescription;
  }

  int getTaskPoint() {
    return _taskDataLevel1[randomTaskNum()].taskPoint;
  }

  int getTaskLevel() {
    // todo: return task level and use it to only show certain tasks
    return 0;
  }

}