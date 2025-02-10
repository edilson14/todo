import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_dto.dart';
import 'package:todo/src/domain/repositories/task_repository_interface.dart';

class CreateTaskUseCase {
  final ITasksRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(CreateTaskDTO task) async {
    return await _taskRepository.addTask(task);
  }
}
