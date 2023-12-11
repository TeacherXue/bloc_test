import 'package:bloc_test/blocs/bloc_exports.dart';
import 'package:bloc_test/models/task.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            Task task = tasks[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                value: task.isDone ?? false,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: task));
                },
              ),
              onLongPress: () => context.read<TaskBloc>().add(DeleteTask(task: task)),
            );
          }),
    );
  }
}
