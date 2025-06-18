import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/home/presentation/cubit/logout_cubit_cubit.dart';
import 'package:new_billing/features/home/presentation/widgets/grid_card.dart';
import 'package:new_billing/features/home/presentation/widgets/logout_dialog.dart';
import 'package:new_billing/init_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showLogoutDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<LogoutCubitCubit>(),
        child: BlocConsumer<LogoutCubitCubit, LogoutCubitState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (Route<dynamic> route) => false,
              );
            }
            if (state is LogoutFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                AppSnackBar(message: "Logout Unsuccessfull.").build(context),
              );
            }
          },
          builder: (context, state) {
            return AppLogoutConfirmationBottomSheet(
              onLogoutPressed: () {
                BlocProvider.of<LogoutCubitCubit>(context).logout();
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog();
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Welcome to Billsoft",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "Get Ready to Generate Bills",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/billing");
                    },
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.receipt_long_rounded,
                              color: AppColors.blue,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Generate Invoice",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    GridCard(
                      onPressed: () {
                        Navigator.pushNamed(context, "/logistics");
                      },
                      icon: Icons.fire_truck_outlined,
                      cardName: "Logistics",
                    ),
                    GridCard(
                      onPressed: () {
                        Navigator.pushNamed(context, "/customers");
                      },
                      icon: Icons.people_outline_rounded,
                      cardName: "Customers",
                    ),
                    GridCard(
                      onPressed: () {
                        Navigator.pushNamed(context, "/firms");
                      },
                      icon: Icons.account_balance_outlined,
                      cardName: "Firms",
                    ),
                    GridCard(
                      onPressed: () {
                        Navigator.pushNamed(context, "/banks");
                      },
                      icon: Icons.currency_rupee,
                      cardName: "Bank",
                    ),
                    GridCard(
                      onPressed: () {
                        Navigator.pushNamed(context, "/history");
                      },
                      icon: Icons.history,
                      cardName: "History",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
