class TaskDTO {
  bool isCompleted;
  String name;
  String description;

  TaskDTO({
    required this.isCompleted,
    required this.name,
    required this.description,
  });

  factory TaskDTO.empty() => TaskDTO(
        isCompleted: false,
        name: '',
        description: '',
      );

  void setIsComplet(bool completed) {
    isCompleted = completed;
  }

  void setName(String newName) {
    name = newName;
  }

  void setDescription(String newDescription) {
    description = newDescription;
  }
}
