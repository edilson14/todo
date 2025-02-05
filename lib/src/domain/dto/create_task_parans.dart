class TaskCreateDTO {
  String name;
  String description;

  TaskCreateDTO({
    required this.name,
    required this.description,
  });

  factory TaskCreateDTO.empty() => TaskCreateDTO(
        name: '',
        description: '',
      );

  void setName(String newName) {
    name = newName;
  }

  void setDescription(String newDescription) {
    description = newDescription;
  }
}
