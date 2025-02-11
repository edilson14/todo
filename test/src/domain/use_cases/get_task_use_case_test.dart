import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/repositories/task_repository.dart';
import 'package:todo/src/domain/entity/task_entity.dart';
import 'package:todo/src/domain/use_cases/get_task_use_case.dart';

import '../../../mocks/repositories_mock_test.dart';

void main() {
  late TaskRepository repository;
  late List<TaskEntity> tasks;
  late GetTaskUseCase getTaskUseCase;

  setUp(
    () {
      tasks = [
        TaskEntity(
          name: 'nomeQualquer aqui',
          description: 'uma descricao legal aqui para poder preencher',
          isCompleted: false,
          taskId: 11111111,
        ),
      ];

      repository = TasksRepositoryMock();
      getTaskUseCase = GetTaskUseCase(repository);
      registerFallbackValue(tasks);
    },
  );

  group(
    'Teste de use case de listagem de tarefas\n',
    () {
      test(
        'Garantir que o repository ta sendo chamado',
        () async {
          when(
            () => repository.getTasks(),
          ).thenAnswer(
            (_) async => tasks.toSuccess(),
          );

          await getTaskUseCase.call();

          verify(
            () => repository.getTasks(),
          ).called(1);
        },
      );

      test(
        'Fluxo retornando todos os dados da lista',
        () async {
          when(
            () => repository.getTasks(),
          ).thenAnswer(
            (_) async => tasks.toSuccess(),
          );
          final listTasks = await getTaskUseCase.call().getOrNull();

          expect(listTasks!.length, 1);
        },
      );

      test(
        'Deve retornar uma lista vazia',
        () async {
          when(
            () => repository.getTasks(),
          ).thenAnswer(
            (_) async => <TaskEntity>[].toSuccess(),
          );

          final listTasks = await getTaskUseCase.call().getOrNull();

          expect(listTasks!.length, 0);
        },
      );
    },
  );
}
