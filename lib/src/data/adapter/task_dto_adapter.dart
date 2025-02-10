import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

class TaskDtoAdapter {
  static TaskEntity toEntity(TaskDTO task) => TaskEntity(
        name: task.name,
        description: task.description,
        taskId: task.taskId,
        isCompleted: task.isCompleted,
      );
}
