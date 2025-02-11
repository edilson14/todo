import 'package:result_dart/result_dart.dart';
import 'package:todo/src/core/extensions/lucid_extsion.dart';
import 'package:todo/src/domain/dto/create_task_dto.dart';
import 'package:todo/src/domain/repositories/task_repository_interface.dart';
import 'package:todo/src/domain/validator/create_task_validator.dart';

class CreateTaskUseCase {
  final ITasksRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  AsyncResult<Unit> call(CreateTaskDTO task) async {
    final createTaskValidator = CreateTaskValidator();

    return await createTaskValidator
        .validateResult(task) //
        .flatMap(_taskRepository.addTask);
  }
}
