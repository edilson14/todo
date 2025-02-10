import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:todo/src/data/adapter/create_task_dto_adapter.dart';
import 'package:todo/src/data/adapter/task_dto_adapter.dart';
import 'package:todo/src/data/adapter/task_entity_adapter.dart';
import 'package:todo/src/domain/dto/create_task_dto.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entity/task_entity.dart';
import 'package:todo/src/external/local_storage_interface.dart';

class TaskDataSource {
  final LocalStorageServiceInterface _preferences;

  TaskDataSource(this._preferences);

  AsyncResult<Unit> addTask(CreateTaskDTO task) async {
    try {
      final allTasks = await _preferences.getListItens() ?? [];
      allTasks.add(jsonEncode(CreateTaskDtoAdapter.toMap(task)));

      _preferences.saveListItens(allTasks);

      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<List<TaskEntity>> getTasks() async {
    try {
      final taskList = await _loadTaskFromCache();

      var taskEnteties = _convertTasksListToTaskEntities(taskList);
      return taskEnteties.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<Unit> deleteTask(TaskDTO task) async {
    try {
      var allTasks =
          _convertTasksListToTaskEntities(await _loadTaskFromCache());

      allTasks.removeWhere((item) => item.taskId == task.taskId);

      _preferences.saveListItens(
        allTasks
            .map(
              (item) => jsonEncode(TaskEntityAdapter.toJson(item)),
            )
            .toList(),
      );
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<Unit> updateTask(TaskDTO task) async {
    try {
      var allTasks =
          _convertTasksListToTaskEntities(await _loadTaskFromCache());

      allTasks.removeWhere((item) => item.taskId == task.taskId);
      allTasks.add(TaskDtoAdapter.toEntity(task));

      _preferences.saveListItens(
        allTasks
            .map(
              (item) => jsonEncode(TaskEntityAdapter.toJson(item)),
            )
            .toList(),
      );

      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  Future<List<String>?> _loadTaskFromCache() async {
    final allTasks = _preferences.getListItens();

    return allTasks;
  }

  List<TaskEntity> _convertTasksListToTaskEntities(List<String>? tasks) {
    if (tasks == null) return <TaskEntity>[];
    return tasks
        .map(
          (task) => TaskEntityAdapter.taskEntityFromJson(
            jsonDecode(task),
          ),
        )
        .toList();
  }
}
