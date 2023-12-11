// ignore_for_file: must_be_immutable
import 'package:bloc_test/blocs/bloc_exports.dart';
import 'package:bloc_test/models/task.dart';
import 'package:bloc_test/screens/add_task_widget.dart';
import 'package:bloc_test/widgets/tasts_list.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskWidget(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskInitial>(
      builder: (context, state) {
        List<Task> tasks = state.allTasks;
        return Scaffold(
            appBar: AppBar(
              title: const Text('Tasks'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTask(context),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Chip(
                    label: Text('Tasks'),
                  ),
                ),
                TasksList(tasks: tasks),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addTask(context),
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}
