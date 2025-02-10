class TaskEntity {
  final String name;
  final String description;
  final bool isCompleted;
  final int taskId;

  TaskEntity({
    required this.name,
    required this.description,
    this.isCompleted = false,
    required this.taskId,
  });

  TaskEntity copyWith({
    String? name,
    String? description,
    bool? isCompleted,
  }) {
    return TaskEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      taskId: taskId,
    );
  }

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      name: json['name'],
      description: json['description'],
      taskId: json['taskId'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'taskId': taskId,
      'isCompleted': isCompleted,
    };
  }
}
