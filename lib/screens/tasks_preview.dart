import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/providers/tasks_provider.dart';
import 'package:todo_list/screens/tasks_details.dart';

import '../models/task.dart';
import '../todo_list_app.dart';

class TaskPreview extends StatelessWidget {
  final Task? task;

  const TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      title: Text(
        task?.title ?? '',
        style: const TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(task?.content ?? ''),
      leading: IconButton(
        onPressed: ()async{
          task!.completed=!task!.completed;
          await TasksProvider().modifyTask(task!);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>
              const ToDoListApp()));
        },
        icon: task!.completed
          ? Icon(
        Icons.check,
        color: Colors.green,
      )
          : Icon(
        Icons.warning,
        color: Colors.red,
      ),),
      hoverColor: task!.completed
          ? const Color.fromRGBO(105, 240, 174, 1.0)
          : const Color.fromRGBO(255, 82, 82, 1.0),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TasksDetails(task: task)));
      },
    );
  }
}
