import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

abstract class ITasksRepository {
  AsyncResult<List<TaskEntity>> getTasks();
  AsyncResult<Unit> addTask(TaskEntity task);
  AsyncResult<Unit> updateTask(TaskEntity task);
  AsyncResult<Unit> deleteTask(TaskEntity task);
}
