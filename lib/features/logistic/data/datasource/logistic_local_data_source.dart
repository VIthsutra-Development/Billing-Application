import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class LogisticLocalDataSource {
  String getUserId();
}

class LogisticLocalDataSourceImpl implements LogisticLocalDataSource {
  final Box<String> box;
  LogisticLocalDataSourceImpl({required this.box});
  @override
  String getUserId() {
    final userId = box.get("user_id");
    if (userId == null) {
      throw LocalStorageException(message: "User Id Not Exist, Try Again.");
    }
    return userId;
  }
}
