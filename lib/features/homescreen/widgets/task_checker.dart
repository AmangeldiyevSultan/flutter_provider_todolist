import 'package:flutter/material.dart';
import 'package:flutter_provider/models/task.dart';
import 'package:flutter_provider/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

class Tasks extends StatefulWidget {
  final Task task;
  const Tasks({super.key, required this.task});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    return ListTile(
      leading: GestureDetector(
        onLongPress: () {
          provider.deleteTaks(widget.task);
        },
        child: Text(
          widget.task.name,
          style: TextStyle(
              fontSize: 20,
              decoration:
                  widget.task.isDone ? TextDecoration.lineThrough : null),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Checkbox(
        value: widget.task.isDone,
        onChanged: (value) => provider.updateTask(widget.task),
      ),
    );
  }
}
