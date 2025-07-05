import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_billing/core/themes/colors.dart';

class CustomAppBar {
  Future<void> _logout() async {
    final box = await Hive.openBox("authtoken");
    box.delete("token");
    box.close();
  }

  PreferredSizeWidget? build(BuildContext context, [bool isHomePage = false]) {
    return AppBar(
      title: Text("Billsoft"),
      leading: Icon(Icons.receipt_long),
      actions: isHomePage
          ? [
              IconButton(
                onPressed: () {
                  _logout();
                  Navigator.pushReplacementNamed(context, "/login");
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.blue,
                ),
              ),
            ]
          : null,
    );
  }
}
