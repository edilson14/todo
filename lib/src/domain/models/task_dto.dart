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

  setIsComplet(bool completed){
    isCompleted = completed;
  }

  setName(String newName){
    name = newName;
  }

  setDescription(String newDescription){
    description = newDescription;
  }


}