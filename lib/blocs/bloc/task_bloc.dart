// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_test/blocs/bloc_exports.dart';
import 'package:bloc_test/models/task.dart';
import 'package:equatable/equatable.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskInitial> {
  TaskBloc() : super(const TaskInitial()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskInitial> emit) {
    final state = this.state;
    final List<Task> allTasks = <Task>[...state.allTasks, event.task];
    emit(TaskInitial(allTasks: allTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskInitial> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    final List<Task> allTasks = <Task>[...state.allTasks]..remove(task);
    task.isDone == false ? allTasks.insert(index, task.copyWith(isDone: true)) : allTasks.insert(index, task.copyWith(isDone: false));
    emit(TaskInitial(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskInitial> emit) {
    final state = this.state;
    emit(TaskInitial(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TaskInitial? fromJson(Map<String, dynamic> json) {
    return TaskInitial.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskInitial state) {
    return state.toMap();
  }
}
