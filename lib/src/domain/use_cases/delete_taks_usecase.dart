import 'package:result_dart/result_dart.dart';
import 'package:todo/src/core/extensions/lucid_extsion.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/repositories/task_repository_interface.dart';
import 'package:todo/src/domain/validator/task_validator.dart';

class DeletetaskUseCase {
  final ITasksRepository _taskRepository;

  DeletetaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(TaskDTO task) async {
    final taskValidator = TaskValidator();

    return await taskValidator
        .validateResult(task)
        .flatMap(_taskRepository.deleteTask);
  }
}
