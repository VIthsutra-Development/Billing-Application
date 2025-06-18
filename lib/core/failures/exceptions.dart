class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class LocalStorageException implements Exception {
  final String message;
  LocalStorageException({required this.message});
}
