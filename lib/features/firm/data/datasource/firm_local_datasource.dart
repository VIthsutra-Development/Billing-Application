import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class FirmLocalDataSource {
  String getUserId();
}

class FirmLocalDataSourceImpl implements FirmLocalDataSource {
  final Box<String> box;
  FirmLocalDataSourceImpl({required this.box});
  @override
  String getUserId() {
    final userId = box.get("user_id");
    if (userId == null) {
      throw LocalStorageException(message: "User Id Not Exist, Try Again.");
    }
    return userId;
  }
}