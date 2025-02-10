import 'package:todo/src/domain/entity/task_entity.dart';

class TaskDTO {
  String name;
  String description;
  bool isCompleted;
  int taskId;

  TaskDTO({
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.taskId,
  });

  factory TaskDTO.fromEntity(TaskEntity entity) => TaskDTO(
        name: entity.name,
        description: entity.description,
        isCompleted: entity.isCompleted,
        taskId: entity.taskId,
      );

  void setName(String newName) {
    name = newName;
  }

  void setDescription(String newDescription) {
    description = newDescription;
  }

  void setIsComplet(bool completed) {
    isCompleted = completed;
  }
}
