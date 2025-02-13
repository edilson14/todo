import 'package:lucid_validation/lucid_validation.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

class TaskValidator extends LucidValidator<TaskDTO> {
  TaskValidator() {
    ruleFor((task) => task.name, key: 'name') //
        .notEmpty(message: 'Nome nao pode ser vazio')
        .minLength(3, message: 'Nome deve ter no minimo 3 caracteres');

    ruleFor((task) => task.description, key: 'description') //
        .notEmpty(message: 'Descrição nao pode ser vazia')
        .minLength(10, message: 'Descrição deve ter no minimo 10 caracteres');
  }
}
