import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:new_billing/features/authentication/presentation/cubit/auto_login_cubit.dart';
import 'package:new_billing/features/authentication/presentation/pages/login.dart';
import 'package:new_billing/features/authentication/presentation/pages/register.dart';
import 'package:new_billing/features/bank/presentation/cubit/add_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/cubit/delete_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/cubit/fetch_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/pages/bank_page.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_bank_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_customer_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_firm_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_logistic_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/submit_invoice_cubit.dart';
import 'package:new_billing/features/billing/presentation/pages/billing_page.dart';
import 'package:new_billing/features/customer/presentation/cubit/add_customer_cubit.dart';
import 'package:new_billing/features/customer/presentation/cubit/delete_customer_cubit.dart';
import 'package:new_billing/features/customer/presentation/cubit/fetch_customer_cubit.dart';
import 'package:new_billing/features/firm/presentation/cubit/add_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/cubit/delete_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/cubit/fetch_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/pages/firm_page.dart';
import 'package:new_billing/features/history/presentation/bloc/history_bloc.dart';
import 'package:new_billing/features/history/presentation/cubit/delete_invoice_cubit.dart';
import 'package:new_billing/features/history/presentation/cubit/payment_status_updater_cubit.dart';
import 'package:new_billing/features/history/presentation/pages/history_page.dart';
import 'package:new_billing/features/home/presentation/cubit/logout_cubit_cubit.dart';
import 'package:new_billing/features/home/presentation/pages/home.dart';
import 'package:new_billing/features/customer/presentation/pages/customer_page.dart';
import 'package:new_billing/features/logistic/presentation/cubit/add_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/cubit/delete_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/cubit/fetch_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/pages/logistics_page.dart';
import 'package:new_billing/features/products/presentation/cubit/add_product_cubit.dart';
import 'package:new_billing/features/products/presentation/cubit/delete_product_cubit.dart';
import 'package:new_billing/features/products/presentation/cubit/fetch_product_cubit.dart';
import 'package:new_billing/features/products/presentation/pages/products_page.dart';
import 'package:new_billing/features/splash/presentation/page/splash_screen.dart';
import 'package:new_billing/init_dependencies.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    const String splash = "/splash";
    const String login = "/login";
    const String register = "/register";
    const String home = "/home";
    const String history = "/history";
    const String logistics = "/logistics";
    const String firms = "/firms";
    const String customers = "/customers";

    const String billing = "/billing";
    const String products = "/products";
    const String banks = "/banks";
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<AutoLoginCubit>(),
            child: SplashScreen(),
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<AuthBloc>(),
            child: LoginPage(),
          ),
        );

      case register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<AuthBloc>(),
            child: RegisterPage(),
          ),
        );

      case banks:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<FetchBankCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AddBankCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<DeleteBankCubit>(),
              ),
            ],
            child: BankPage(),
          ),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<LogoutCubitCubit>(),
            child: HomePage(),
          ),
        );

      case billing:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<FetchBankCubits>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<FetchLogisticCubits>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<FetchCustomerCubits>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<FetchFirmCubits>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<SubmitInvoiceCubit>(),
              ),
            ],
            child: BillingPage(),
          ),
        );

      case products:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => serviceLocator<FetchProductCubit>()),
              BlocProvider(
                  create: (context) => serviceLocator<DeleteProductCubit>()),
              BlocProvider(
                  create: (context) => serviceLocator<AddProductCubit>()),
            ],
            child: ProductsPage(),
          ),
        );

      case history:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<HistoryBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<DeleteInvoiceCubit>(),
              ),
              BlocProvider(
                create: (context) =>
                    serviceLocator<PaymentStatusUpdaterCubit>(),
              ),
            ],
            child: HistoryPage(),
          ),
        );

      case customers:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<AddCustomerCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<DeleteCustomerCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<FetchCustomerCubit>(),
              ),
            ],
            child: CustomerPage(),
          ),
        );
      case logistics:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<FetchLogisticCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<DeleteLogisticCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AddLogisticCubit>(),
              ),
            ],
            child: LogisticsPage(),
          ),
        );
      case firms:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<FetchFirmCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<DeleteFirmCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AddFirmCubit>(),
              ),
            ],
            child: FirmPage(),
          ),
        );
    }
    return null;
  }
}
