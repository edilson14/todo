import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';

abstract class ITasksRepository {
  AsyncResult<List<TaskEntetie>> getTasks();
  AsyncResult<TaskEntetie> addTask(TaskCreateDTO task);
  AsyncResult<TaskEntetie> updateTask(TaskDTO task);
  AsyncResult<Unit> deleteTask(TaskDTO task);
}
