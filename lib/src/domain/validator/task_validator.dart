import 'package:lucid_validation/lucid_validation.dart';
import 'package:todo/src/domain/entity/task_entity.dart';

class TaskValidator extends LucidValidator<TaskEntity> {
  TaskValidator() {
    ruleFor((task) => task.name, key: 'name') //
        .isEmpty(message: 'Nome nao pode ser vazio')
        .minLength(3, message: 'Nome deve ter no minimo 3 caracteres');

    ruleFor((task) => task.description, key: 'description') //
        .isEmpty(message: 'Descrição nao pode ser vazia')
        .minLength(10, message: 'Descrição deve ter no minimo 10 caracteres');
  }
}
