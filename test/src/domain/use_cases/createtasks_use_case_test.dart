import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/repositories/task_repository.dart';
import 'package:todo/src/domain/dto/dto.dart';
import 'package:todo/src/domain/use_cases/createtasks_use_case.dart';

import '../../../mocks/repositories_mock_test.dart';

void main() {
  late TaskRepository taskRepository;
  late CreateTaskUseCase createTaskUseCase;
  // somente os dados que
  late CreateTaskDTO createTaskDTO;
  setUp(
    () {
      createTaskDTO = CreateTaskDTO(
        name: 'edilson',
        description: 'deixa kjsdhsd dsjkhfids dfsjhk dfskjhkjdsf kjsdfhkjver',
      );
      taskRepository = TasksRepositoryMock();
      createTaskUseCase = CreateTaskUseCase(taskRepository);
      registerFallbackValue(createTaskDTO);
    },
  );

  group(
    'Testando o use case da criacao de Tasks \n',
    () {
      test(
        'Deve retornar um erro que o nome nao deve ser vazio',
        () async {
          final createDTO = CreateTaskDTO(
            name: '',
            description: 'Uma descricao bem longa só para nao dar problema',
          );
          final result = await createTaskUseCase.call(createDTO);
          final exception = result.exceptionOrNull();

          expect(
            exception!.toString(),
            Exception('O nome não deve ser vazio').toString(),
          );
        },
      );

      test(
        'Deve retornar que o nome da tarefa tem que ter pelo menos 3 caracteres',
        () async {
          final createTaskDTO = CreateTaskDTO(
            name: 'e',
            description: 'descricao muito legal para poder ser bom',
          );

          final result = await createTaskUseCase.call(createTaskDTO);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('O nome deve ter pelo menos 3 caracteres').toString(),
          );
        },
      );

      test(
        'Deve retornar que a descricao nao pode ser vazio',
        () async {
          final createTaskDTO = CreateTaskDTO(
            name: 'edilson',
            description: '',
          );

          final result = await createTaskUseCase.call(createTaskDTO);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('A descricão não pode ser vazia').toString(),
          );
        },
      );

      test(
        'Deve retornar que a descricao pode ter pelo menos 10 caracters',
        () async {
          final createTaskDTO = CreateTaskDTO(
            name: 'edilson',
            description: 'curta',
          );

          final result = await createTaskUseCase.call(createTaskDTO);
          final expection = result.exceptionOrNull();

          expect(
            expection!.toString(),
            Exception('A descricao deve conter pelo menos 10 caracters')
                .toString(),
          );
        },
      );

      test(
        'Fluxo completo com todos os dados corretos',
        () async {
          verifyNever(() => taskRepository.addTask(createTaskDTO));

          when(
            () => taskRepository.addTask(
              createTaskDTO,
            ),
          ).thenAnswer(
            (_) async => unit.toSuccess(),
          );
          await createTaskUseCase.call(createTaskDTO);
          verify(
            () => taskRepository.addTask(
              createTaskDTO,
            ),
          ).called(1);
        },
      );
    },
  );
}
