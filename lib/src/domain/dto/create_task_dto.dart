// ignore_for_file: public_member_api_docs, sort_constructors_first

class CreateTaskDTO {
  String name;
  String description;

  CreateTaskDTO({
    required this.name,
    required this.description,
  });

  factory CreateTaskDTO.fromEmpty() => CreateTaskDTO(
        name: '',
        description: '',
      );

  void setName(String newName) {
    name = newName;
  }

  void setDescription(String novoDescription) {
    description = novoDescription;
  }
}
