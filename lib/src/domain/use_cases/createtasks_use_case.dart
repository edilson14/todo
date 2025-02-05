import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';
import 'package:todo/src/domain/repository/task_repository_interface.dart';

class CreateTaskUseCase {
  final ITasksRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  AsyncResult<TaskEntetie> call(TaskCreateDTO task) async {
    return await _taskRepository.addTask(task);
  }
}
