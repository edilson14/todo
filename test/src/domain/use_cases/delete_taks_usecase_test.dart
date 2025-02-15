import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/repositories/task_repository.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/use_cases/delete_taks_usecase.dart';

import '../../../mocks/repositories_mock_test.dart';

void main() {
  late TaskRepository repository;
  late DeletetaskUseCase deletetaskUseCase;
  late TaskDTO taskToDelete;

  setUp(
    () {
      repository = TasksRepositoryMock();
      deletetaskUseCase = DeletetaskUseCase(repository);
      taskToDelete = TaskDTO(
        name: 'Task para apagar',
        description: 'description',
        isCompleted: true,
        taskId: 1,
      );

      registerFallbackValue(taskToDelete);
    },
  );

  group(
    'Testando o caso de uso de Apagar as tarefas\n',
    () {
      test(
        'Garantindo que o repository é chamado quando a acao é executada',
        () async {
          when(() => repository.deleteTask(taskToDelete.taskId.toString()))
              .thenAnswer(
            (_) async => unit.toSuccess(),
          );
          await deletetaskUseCase.call(taskToDelete.taskId.toString());

          verify(
            () => repository.deleteTask(taskToDelete.taskId.toString()),
          ).called(1);
        },
      );
    },
  );
}
