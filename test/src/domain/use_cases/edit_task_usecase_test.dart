import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/repositories/task_repository.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/use_cases/edit_task_usecase.dart';

import '../../../mocks/repositories_mock_test.dart';

void main() {
  late EditTaskUseCase editTaskUseCase;
  late TaskRepository taskRepository;
  late TaskDTO taskToEdit;
  setUp(
    () {
      taskToEdit = TaskDTO(
        name: 'Tas',
        description: 'descricao pequena',
        isCompleted: false,
        taskId: 1,
      );
      taskRepository = TasksRepositoryMock();
      editTaskUseCase = EditTaskUseCase(taskRepository);
    },
  );
  group(
    'Testando o caso de uso de edicao da tarefa',
    () {
      test(
        'retornar erro que o nome nao deve ser vazio',
        () async {
          final imcompleteTask = TaskDTO(
            name: '',
            description: 'descricao complete do resultado',
            isCompleted: true,
            taskId: 1,
          );

          final resultado = await editTaskUseCase.call(imcompleteTask);
          final exception = resultado.exceptionOrNull();

          expect(
            exception!.toString(),
            Exception('Nome nao pode ser vazio').toString(),
          );
        },
      );

      test(
        'Deve retornar que o nome da tarefa tem que ter pelo menos 3 caracteres',
        () async {
          final taskToEdit = TaskDTO(
            name: 'e',
            description: 'descricao muito legal para poder ser bom',
            isCompleted: false,
            taskId: 2,
          );

          final result = await editTaskUseCase.call(taskToEdit);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('Nome deve ter no minimo 3 caracteres').toString(),
          );
        },
      );

      test(
        'Deve retornar que a descricao nao pode ser vazio',
        () async {
          final taskToEdit = TaskDTO(
            name: 'edilson',
            isCompleted: true,
            taskId: 12,
            description: '',
          );

          final result = await editTaskUseCase.call(taskToEdit);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('Descrição nao pode ser vazia').toString(),
          );
        },
      );

      test(
        'Deve retornar que a descricao pode ter pelo menos 10 caracters',
        () async {
          final taskToEdit = TaskDTO(
            name: 'edilson',
            description: 'curta',
            isCompleted: true,
            taskId: 3,
          );

          final result = await editTaskUseCase.call(taskToEdit);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('Descrição deve ter no minimo 10 caracteres').toString(),
          );
        },
      );

      test(
        'edicao completa da tarefa',
        () async {
          when(() => taskRepository.updateTask(taskToEdit)).thenAnswer(
            (_) async => unit.toSuccess(),
          );

          await editTaskUseCase.call(taskToEdit);

          verify(
            () => taskRepository.updateTask(
              taskToEdit,
            ),
          ).called(1);
        },
      );
    },
  );
}
