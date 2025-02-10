import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/entity/task_entity.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class DeletetaskUseCase {
  final ITasksRepository _taskRepository;

  DeletetaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(TaskEntity task) async {
    return _taskRepository.deleteTask(task);
  }
}
