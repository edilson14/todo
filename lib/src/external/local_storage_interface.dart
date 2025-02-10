abstract class LocalStorageServiceInterface {
  Future<List<String>?> getListItens();
  Future<void> saveListItens(List<String> itens);
}
