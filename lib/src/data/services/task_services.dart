import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

const taskLocalStorageKey = 'local_storage_tasks';

class TaskServices {
  AsyncResult<Unit> addTask(TaskEntity task) async {
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      final allTasks =
          sharedPreference.getStringList(taskLocalStorageKey) ?? [];
      allTasks.add(jsonEncode(task.toMap()));

      sharedPreference.setStringList(taskLocalStorageKey, allTasks);

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

  AsyncResult<Unit> deleteTask(TaskEntity task) async {
    try {
      var sharedPreference = await SharedPreferences.getInstance();
      var allTasks =
          (_convertTasksListToTaskEntities(await _loadTaskFromCache()));

      allTasks.removeWhere((item) => item.taskId == task.taskId);

      sharedPreference.setString(
        taskLocalStorageKey,
        jsonEncode(
          allTasks.map(
            (item) => item.toMap(),
          ),
        ),
      );
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<Unit> updateTask(TaskEntity task) async {
    try {
      var sharedPreference = await SharedPreferences.getInstance();
      var allTasks =
          (_convertTasksListToTaskEntities(await _loadTaskFromCache()));

      allTasks.removeWhere((item) => item.taskId == task.taskId);
      allTasks.add(task);

      sharedPreference.setString(
        taskLocalStorageKey,
        jsonEncode(
          allTasks.map(
            (item) => item.toMap(),
          ),
        ),
      );

      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  Future<List<String>?> _loadTaskFromCache() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final allTasks = sharedPreferences.getStringList(taskLocalStorageKey);

    return allTasks;
  }

  List<TaskEntity> _convertTasksListToTaskEntities(List<String>? tasks) {
    if (tasks == null) return <TaskEntity>[];
    return tasks.map((task) => TaskEntity.fromJson(jsonDecode(task))).toList();
  }
}
