import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/data_source/task_datasource.dart';
import 'package:todo/src/domain/dto/create_task_dto.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entity/task_entity.dart';
import 'package:todo/src/domain/repositories/task_repository_interface.dart';

class TaskRepository implements ITasksRepository {
  final TaskDataSource _dataSource;

  TaskRepository(this._dataSource);

  @override
  AsyncResult<Unit> addTask(CreateTaskDTO task) async {
    return _dataSource.addTask(task);
  }

  @override
  AsyncResult<Unit> deleteTask(String taskID) {
    return _dataSource.deleteTask(taskID);
  }

  @override
  AsyncResult<List<TaskEntity>> getTasks() async {
    return await _dataSource.getTasks();
  }

  @override
  AsyncResult<Unit> updateTask(TaskDTO task) async {
    return await _dataSource.updateTask(task);
  }
}
