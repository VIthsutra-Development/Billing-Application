import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Connection {
  Future<bool> checkConnection() async {
    return await InternetConnection().hasInternetAccess;
  }
}
