import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/services/task_services.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class TaskRepository implements ITasksRepository {
  final TaskServices _taskServices;

  TaskRepository(this._taskServices);

  @override
  AsyncResult<Unit> addTask(TaskCreateDTO task) async {
    return _taskServices.addTask(task);
  }

  @override
  AsyncResult<Unit> deleteTask(TaskDTO task) async {
    await _taskServices.deleteTask(task);
    return unit.toSuccess();
  }

  @override
  AsyncResult<List<TaskEntetie>> getTasks() async {
    return await _taskServices.getTasks();
  }

  @override
  AsyncResult<Unit> updateTask(TaskDTO task) async {
    await _taskServices.updateTask(task);
    return unit.toSuccess();
  }
}
