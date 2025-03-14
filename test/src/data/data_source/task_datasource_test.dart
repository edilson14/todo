import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/data_source/task_datasource.dart';
import 'package:todo/src/external/local_storage_interface.dart';

import '../../../mocks/local_storage_service_mock.dart';

void main() {
  late LocalStorageServiceInterface localStorageServiceInterface;
  late TaskDataSource taskDataSource;
  setUp(
    () {
      localStorageServiceInterface = LocalStorageServiceMock();

      taskDataSource = TaskDataSource(localStorageServiceInterface);
    },
  );
  group(
    'Testando data source da tarefas',
    () {
      test(
        'garantido o funcionamento do metodo de apagar a tarefa',
        () async {
          when(
            () => localStorageServiceInterface.saveListItens(['1']),
          ).thenAnswer(
            (_) async => unit.toSuccess(),
          );
          when(() => localStorageServiceInterface.getListItens())
              .thenAnswer((_) async => null);
          await taskDataSource.deleteTask('1');

          verifyNever(
            () => localStorageServiceInterface.saveListItens(
              ['tasks'],
            ),
          );
        },
      );
    },
  );
}
