import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/src/external/local_storage_interface.dart';

const taskLocalStorageKey = 'local_storage_tasks';

class LocalStorageService implements LocalStorageServiceInterface {
  @override
  Future<List<String>?> getListItens() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getStringList(taskLocalStorageKey);
  }

  @override
  Future<void> saveListItens(List<String> itens) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(taskLocalStorageKey, itens);
  }
}
