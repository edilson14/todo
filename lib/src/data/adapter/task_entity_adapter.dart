import 'package:todo/src/domain/entity/task_entity.dart';

class TaskEntityAdapter {
  static Map<String, dynamic> toJson(TaskEntity taskEntity) {
    return {
      'name': taskEntity.name,
      'description': taskEntity.description,
      'taskId': taskEntity.taskId,
      'isCompleted': taskEntity.isCompleted,
    };
  }

  static TaskEntity taskEntityFromJson(Map<String, dynamic> json) {
    return TaskEntity(
      isCompleted: json['isCompleted'],
      name: json['name'],
      description: json['description'],
      taskId: json['taskId'],
    );
  }
}
