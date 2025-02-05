import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';

import '../repository/task_repository_interface.dart';

class GetTaskUseCase {
  final ITasksRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  AsyncResult<List<TaskEntetie>> call() async {
    return _taskRepository.getTasks();
  }
}
