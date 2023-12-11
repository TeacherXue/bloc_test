// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
  bool? isDone;
  bool? isDeleted;
  Task({
    required this.title,
    this.isDone,
    this.isDeleted,
  });

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(title: $title, isDone: $isDone, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title && other.isDone == isDone && other.isDeleted == isDeleted;
  }

  @override
  int get hashCode => title.hashCode ^ isDone.hashCode ^ isDeleted.hashCode;

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeleted,
      ];
}
