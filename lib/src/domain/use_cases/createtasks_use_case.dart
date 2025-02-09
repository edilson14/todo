import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class CreateTaskUseCase {
  final ITasksRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(TaskCreateDTO task) async {
    return await _taskRepository.addTask(task);
  }
}
