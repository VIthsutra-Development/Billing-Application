import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_delete_confirmation_bottom_sheet.dart';
import 'package:new_billing/core/widgets/app_empty_widget.dart';
import 'package:new_billing/core/widgets/app_error_widget.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/logistic/presentation/cubit/add_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/cubit/delete_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/cubit/fetch_logistic_cubit.dart';
import 'package:new_billing/features/logistic/presentation/widgets/add_logistic_form.dart';
import 'package:new_billing/features/logistic/presentation/widgets/logistic_loading_widget.dart';
import 'package:new_billing/features/logistic/presentation/widgets/logistic_tile.dart';
import 'package:new_billing/init_dependencies.dart';

class LogisticsPage extends StatefulWidget {
  const LogisticsPage({super.key});

  @override
  State<LogisticsPage> createState() => _LogisticsPageState();
}

class _LogisticsPageState extends State<LogisticsPage> {
  final TextEditingController _logisticNameController = TextEditingController();
  final TextEditingController _logisticPhoneNumberController =
      TextEditingController();
  final TextEditingController _logisticStateController =
      TextEditingController();
  final TextEditingController _logisticStatecodeController =
      TextEditingController();
  final TextEditingController _logisticGstController = TextEditingController();
  final TextEditingController _logisticAddressController =
      TextEditingController();

  @override
  void initState() {
    _fetchDataCubit();
    super.initState();
  }

  // Fetch Logistics Function
  void _fetchDataCubit() {
    BlocProvider.of<FetchLogisticCubit>(context).fetchLogistics();
  }

  // Add Logistics Bottom Sheet
  void _showAddLogisticBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<AddLogisticCubit>(),
        child: BlocBuilder<AddLogisticCubit, AddLogisticState>(
          builder: (context, state) {
            return BlocListener<AddLogisticCubit, AddLogisticState>(
              listener: (context, state) {
                if (state is AddLogisticSuccessState) {
                  Navigator.pop(context);
                  _clearControllers();
                  _fetchDataCubit();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
                if (state is AddLogisticFailureState) {
                  Navigator.pop(context);
                  _clearControllers();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
              },
              child: AddLogisticForm(
                logisticAddressController: _logisticAddressController,
                logisticNameController: _logisticNameController,
                logisticGstController: _logisticGstController,
                logisticPhone: _logisticPhoneNumberController,
                logisticStateCode: _logisticStatecodeController,
                logisticStateController: _logisticStateController,
                onPressed: () {
                  BlocProvider.of<AddLogisticCubit>(context).addLogistic(
                    logisticName: _logisticNameController.text,
                    logisticAddress: _logisticAddressController.text,
                    logisticGstNumber: _logisticGstController.text,
                    logisticPhoneNumber: _logisticPhoneNumberController.text,
                    logisticState: _logisticStateController.text,
                    logisticStateCode: _logisticStatecodeController.text,
                  );
                },
                isLoading: state is AddLogisticLoadingState,
              ),
            );
          },
        ),
      ),
    );
  }

  // Delete Bottom Sheet
  void _showDeleteBottomsheet({
    required String logisticsName,
    required String logisticsAddress,
    required String logisticId,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<DeleteLogisticCubit>(),
        child: BlocBuilder<DeleteLogisticCubit, DeleteLogisticState>(
          builder: (context, state) {
            return BlocListener<DeleteLogisticCubit, DeleteLogisticState>(
              listener: (context, state) {
                if (state is DeleteLogisticSuccessState) {
                  Navigator.pop(context);
                  _fetchDataCubit();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
                if (state is DeleteLogisticFailureState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
              },
              child: AppDeleteConfirmationBottomSheet(
                isLoading: state is DeleteLogisticLoadingState,
                title: logisticsName,
                subtitle: logisticsAddress,
                onDeletePressed: () {
                  BlocProvider.of<DeleteLogisticCubit>(context).deleteLogistic(
                    logisticId: logisticId,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // Cleaning The Text Fields
  void _clearControllers() {
    _logisticStatecodeController.clear();
    _logisticAddressController.clear();
    _logisticGstController.clear();
    _logisticNameController.clear();
    _logisticStateController.clear();
    _logisticPhoneNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logistics"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FetchLogisticCubit>(context).fetchLogistics();
            },
            icon: Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FetchLogisticCubit, FetchLogisticState>(
        builder: (context, state) {
          if (state is FetchLogisticLoadingState) {
            return LogisticLoadingWidget();
          }
          if (state is FetchLogisticFailureState) {
            return AppErrorWidget(
              errorMessage: state.message,
              onPressed: () {
                BlocProvider.of<FetchLogisticCubit>(context).fetchLogistics();
              },
            );
          }
          if (state is FetchLogisticSuccessState && state.logistic.isEmpty) {
            return AppEmptyWidget(
              errorMessage: "No Logistic to Display.",
              onPressed: () {
                BlocProvider.of<FetchLogisticCubit>(context).fetchLogistics();
              },
            );
          }
          if (state is FetchLogisticSuccessState) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Logistic's",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Already Existing Logistic's",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return LogisticTile(
                          logisticName: state.logistic[index].logisticName,
                          logisticPhoneNumber:
                              state.logistic[index].logisticPhoneNumber,
                          onDeletePressed: () {
                            _showDeleteBottomsheet(
                              logisticsName: state.logistic[index].logisticName,
                              logisticsAddress:
                                  state.logistic[index].logisticAddress,
                              logisticId: state.logistic[index].logisticId,
                            );
                          },
                          logisticAddress:
                              state.logistic[index].logisticAddress,
                          logisticGstNumber:
                              state.logistic[index].logisticGstNumber,
                          logisticState: state.logistic[index].logisticState,
                        );
                      },
                      itemCount: state.logistic.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              ),
            );
          }
          return LogisticLoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddLogisticBottomsheet();
        },
        child: Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }
}
