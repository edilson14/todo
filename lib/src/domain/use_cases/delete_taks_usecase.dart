import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/repositories/task_repository_interface.dart';

class DeletetaskUseCase {
  final ITasksRepository _taskRepository;

  DeletetaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(String taskID) async {
    return await _taskRepository.deleteTask(taskID);
  }
}
