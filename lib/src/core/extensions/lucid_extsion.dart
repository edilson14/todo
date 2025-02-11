import 'package:lucid_validation/lucid_validation.dart';
import 'package:result_dart/result_dart.dart';

extension TaskValidatorExtension<T extends Object> on LucidValidator<T> {
  AsyncResult<T> validateResult(T value) async {
    final result = validate(value);
    if (result.isValid) {
      return Success(value);
    } else {
      final exception = result.exceptions.first;

      return Failure(Exception(exception.message));
    }
  }
}
