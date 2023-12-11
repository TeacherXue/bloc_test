// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {
  final List<Task> allTasks;
  const TaskInitial({this.allTasks = const []});

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskInitial.fromMap(Map<String, dynamic> map) {
    return TaskInitial(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
