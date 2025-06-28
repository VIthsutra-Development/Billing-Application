import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/routes/generated_routes.dart';
import 'package:new_billing/core/themes/app_theme.dart';
import 'package:new_billing/features/authentication/presentation/cubit/auto_login_cubit.dart';
import 'package:new_billing/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependancies();
  runApp(
    BlocProvider(
      create: (context) => serviceLocator<AutoLoginCubit>(),
      child: BillingApp(),
    ),
  );
}

class BillingApp extends StatelessWidget {
  const BillingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerate,
      initialRoute: "/otp",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: "Billsoft",
    );
  }
}
