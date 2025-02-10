import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/services/task_services.dart';
import 'package:todo/src/domain/entity/task_entity.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class TaskRepository implements ITasksRepository {
  final TaskServices _taskServices;

  TaskRepository(this._taskServices);

  @override
  AsyncResult<Unit> addTask(TaskEntity task) async {
    return _taskServices.addTask(task);
  }

  @override
  AsyncResult<Unit> deleteTask(TaskEntity task) {
    return _taskServices.deleteTask(task);
  }

  @override
  AsyncResult<List<TaskEntity>> getTasks() async {
    return await _taskServices.getTasks();
  }

  @override
  AsyncResult<Unit> updateTask(TaskEntity task) async {
    return await _taskServices.updateTask(task);
  }
}
