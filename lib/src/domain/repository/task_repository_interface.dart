import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

abstract class ITasksRepository {
  AsyncResult<List<TaskDTO>> getTasks();
  AsyncResult<TaskDTO> addTask(TaskDTO task);
  AsyncResult<TaskDTO> updateTask(TaskDTO task);
  AsyncResult<Unit> deleteTask(TaskDTO task);
}
