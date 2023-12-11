import 'package:bloc_test/blocs/bloc_exports.dart';
import 'package:bloc_test/models/task.dart';
import 'package:flutter/material.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController taskTitleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Add Task", style: TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          TextField(
            controller: taskTitleController,
            decoration: const InputDecoration(
              hintText: 'Enter task title',
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var task = Task(title: taskTitleController.text);
              context.read<TaskBloc>().add(AddTask(task: task));
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
