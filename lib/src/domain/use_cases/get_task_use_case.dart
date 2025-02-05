import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

import '../repository/task_repository_interface.dart';

class GetTaskUseCase {
  final ITasksRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  AsyncResult<List<TaskDTO>> call() async {
    return _taskRepository.getTasks();
  }
}
