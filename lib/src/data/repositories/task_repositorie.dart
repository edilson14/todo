import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/services/task_services.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class TaskRepositorie implements ITasksRepository {
  final TaskServices _taskServices;

  TaskRepositorie(this._taskServices);

  @override
  AsyncResult<Unit> addTask(TaskCreateDTO task) async {
    try {
      await _taskServices.addTask(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  @override
  AsyncResult<Unit> deleteTask(TaskDTO task) async {
    try {
      await _taskServices.deleteTask(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  @override
  AsyncResult<List<TaskEntetie>> getTasks() async {
    try {
      final tasks = await _taskServices.getTasks();
      return tasks;
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  @override
  AsyncResult<Unit> updateTask(TaskDTO task) async {
    try {
      _taskServices.updateTask(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }
}
