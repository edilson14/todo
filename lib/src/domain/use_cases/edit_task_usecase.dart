import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class EditTaskUseCase {
  final ITasksRepository _taskRepository;

  EditTaskUseCase(this._taskRepository);

  AsyncResult<TaskDTO> call(TaskDTO task) async {
    return await _taskRepository.updateTask(task);
  }
}
