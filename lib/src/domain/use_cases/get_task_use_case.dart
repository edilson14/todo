import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

import '../repository/task_repository_interface.dart';

class GetTaskUseCase {
  final ITasksRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  AsyncResult<List<TaskEntity>> call() async {
    return _taskRepository.getTasks();
  }
}
