import 'package:result_dart/result_dart.dart';
import 'package:todo/src/domain/dto/create_task_parans.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/enteties/task_entetie.dart';

const taskLocalStorageKey = 'tasks';

class TaskServices {
  AsyncResult<Unit> addTask(TaskCreateDTO task) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // tasks.add(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<List<TaskEntetie>> getTasks() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // return tasks;
      return <TaskEntetie>[].toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<Unit> deleteTask(TaskDTO task) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // tasks.remove(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }

  AsyncResult<Unit> updateTask(TaskDTO task) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // tasks.removeWhere((element) => element.id == task.id);
      // tasks.add(task);
      return unit.toSuccess();
    } catch (e) {
      return AsyncResult.error(e);
    }
  }
}
