import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_dto.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

abstract class ITasksRepository {
  AsyncResult<List<TaskEntity>> getTasks();
  AsyncResult<Unit> addTask(CreateTaskDTO task);
  AsyncResult<Unit> updateTask(TaskDTO task);
  AsyncResult<Unit> deleteTask(String taskID);
}
