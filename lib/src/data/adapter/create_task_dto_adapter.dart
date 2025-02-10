import 'package:todo/src/domain/dto/create_task_dto.dart';

class CreateTaskDtoAdapter {
  static Map<String, dynamic> toMap(CreateTaskDTO task) => {
        'name': task.name,
        'description': task.description,
        'taskId': DateTime.now().microsecondsSinceEpoch,
        'isCompleted': false,
      };
}
