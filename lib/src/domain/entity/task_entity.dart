class TaskEntity {
  final String name;
  final String description;
  final bool isCompleted;
  final int taskId;

  TaskEntity({
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.taskId,
  });
}
