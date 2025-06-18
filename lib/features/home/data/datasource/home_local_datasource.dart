import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class HomeLocalDatasource {
  String logout();
}

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  final Box<String> box;
  HomeLocalDatasourceImpl({required this.box});
  @override
  String logout() {
    try {
      box.delete("token");
      box.delete("user_id");
      return "Logout Successfull.";
    } catch (e) {
      throw LocalStorageException(message: "Logout Failed.");
    }
  }
}
