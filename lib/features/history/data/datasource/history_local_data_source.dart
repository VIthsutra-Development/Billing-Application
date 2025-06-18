import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class HistoryLocalDataSource {
  String getUserId();
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final Box<String> box;
  HistoryLocalDataSourceImpl({required this.box});
  @override
  String getUserId() {
    final String? userId = box.get("user_id");
    if (userId == null) {
      throw LocalStorageException(message: "User Id Not Found, Try Again.");
    }
    return userId;
  }
}
