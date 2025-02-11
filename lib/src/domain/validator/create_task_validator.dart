import 'package:lucid_validation/lucid_validation.dart';
import 'package:todo/src/domain/dto/dto.dart';

class CreateTaskValidator extends LucidValidator<CreateTaskDTO> {
  CreateTaskValidator() {
    ruleFor((task) => task.name, key: 'name') //
        .notEmpty(message: 'O nome não deve ser vazio')
        .minLength(
          3,
          message: 'O nome deve ter pelo menos 3 caracteres',
        );

    ruleFor((task) => task.description, key: 'description') //
        .notEmpty(
          message: 'A descricão não pode ser vazia',
        )
        .minLength(
          10,
          message: 'A descricao deve conter pelo menos 10 caracters',
        );
  }
}
