import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/models/task_dto.dart';

abstract class ITasksRepository {
  AsyncResult<List<TaskDTO>> getTasks();
  AsyncResult<TaskDTO> addTask(TaskDTO task);
  AsyncResult<TaskDTO> updateTask(TaskDTO task);
  AsyncResult<TaskDTO> deleteTask(TaskDTO task);
}
