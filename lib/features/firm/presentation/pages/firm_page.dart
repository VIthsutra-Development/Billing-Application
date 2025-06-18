import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_delete_confirmation_bottom_sheet.dart';
import 'package:new_billing/core/widgets/app_empty_widget.dart';
import 'package:new_billing/core/widgets/app_error_widget.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/firm/presentation/cubit/add_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/cubit/delete_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/cubit/fetch_firm_cubit.dart';
import 'package:new_billing/features/firm/presentation/widgets/add_firm_form.dart';
import 'package:new_billing/features/firm/presentation/widgets/firm_loading_page.dart';
import 'package:new_billing/features/firm/presentation/widgets/firm_tile.dart';
import 'package:new_billing/init_dependencies.dart';

class FirmPage extends StatefulWidget {
  const FirmPage({super.key});

  @override
  State<FirmPage> createState() => _FirmPageState();
}

class _FirmPageState extends State<FirmPage> {
  final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _firmPanController = TextEditingController();
  final TextEditingController _firmGstinController = TextEditingController();
  final TextEditingController _firmPhoneController = TextEditingController();
  final TextEditingController _firmEmailController = TextEditingController();
  final TextEditingController _firmAddressController = TextEditingController();
  final TextEditingController _firmImagePathController =
      TextEditingController();

  @override
  void initState() {
    _fetchFirms();
    super.initState();
  }

  void _clearController() {
    _firmAddressController.clear();
    _firmEmailController.clear();
    _firmGstinController.clear();
    _firmImagePathController.clear();
    _firmNameController.clear();
    _firmPanController.clear();
    _firmPhoneController.clear();
  }

  void _fetchFirms() {
    BlocProvider.of<FetchFirmCubit>(context).fetchFirms();
  }

  void _showAddFirmBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<AddFirmCubit>(),
        child: BlocBuilder<AddFirmCubit, AddFirmState>(
          builder: (context, state) {
            return BlocListener<AddFirmCubit, AddFirmState>(
              listener: (context, state) {
                if (state is AddFirmSuccessState) {
                  Navigator.pop(context);
                  _fetchFirms();
                  _clearController();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(
                      message: state.message,
                    ).build(context),
                  );
                }
                if (state is AddFirmFailureState) {
                  Navigator.pop(context);
                  _clearController();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(
                      message: state.message,
                    ).build(context),
                  );
                }
              },
              child: AddFirmForm(
                isLoading: state is AddFirmLoadingState,
                firmAddressController: _firmAddressController,
                firmEmailController: _firmEmailController,
                firmGstInController: _firmGstinController,
                firmNameController: _firmNameController,
                firmPanNumberController: _firmPanController,
                firmPhoneNumberController: _firmPhoneController,
                firmImagePathController: _firmImagePathController,
                onPressed: () {
                  BlocProvider.of<AddFirmCubit>(context).addFirm(
                    firmName: _firmNameController.text,
                    firmAddress: _firmAddressController.text,
                    firmGstNumber: _firmGstinController.text,
                    firmPhoneNumber: _firmPhoneController.text,
                    firmEmail: _firmEmailController.text,
                    firmPan: _firmPanController.text,
                    firmLogo: _firmImagePathController.text,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDeleteBottomsheet({
    required String firmName,
    required String firmAddress,
    required String firmId,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<DeleteFirmCubit>(),
        child: BlocBuilder<DeleteFirmCubit, DeleteFirmState>(
          builder: (context, state) {
            return BlocListener<DeleteFirmCubit, DeleteFirmState>(
              listener: (context, state) {
                if (state is DeleteFirmSuccessState) {
                  Navigator.pop(context);
                  _fetchFirms();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(
                      message: state.message,
                    ).build(context),
                  );
                }
                if (state is DeleteFirmFailureState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(
                      message: state.message,
                    ).build(context),
                  );
                }
              },
              child: AppDeleteConfirmationBottomSheet(
                isLoading: state is DeleteFirmLoadingState,
                title: firmName,
                subtitle: firmAddress,
                onDeletePressed: () {
                  BlocProvider.of<DeleteFirmCubit>(context).deleteFirm(
                    firmId: firmId,
                  );
                },
              ),
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
        title: Text("Firms"),
        actions: [
          IconButton(
            onPressed: () {
              _fetchFirms();
            },
            icon: Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FetchFirmCubit, FetchFirmState>(
        builder: (context, state) {
          if (state is FetchFirmLoadingState) {
            return FirmLoadingWidget();
          }
          if (state is FetchFirmFailureState) {
            return AppErrorWidget(
              errorMessage: state.message,
              onPressed: () {
                _fetchFirms();
              },
            );
          }
          if (state is FetchFirmSuccessState && state.firm.isEmpty) {
            return AppEmptyWidget(
              errorMessage: "No Firms To Display.",
              onPressed: () {
                _fetchFirms();
              },
            );
          }
          if (state is FetchFirmSuccessState) {
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
                          "Firm's",
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
                          "Already Exesting Firm's",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return FirmTile(
                          firmEmail: state.firm[index].firmEmail,
                          firmPanNumber: state.firm[index].firmPan,
                          firmName: state.firm[index].firmName,
                          firmPhoneNumber: state.firm[index].firmPhoneNumber,
                          onDeletePressed: () {
                            _showDeleteBottomsheet(
                              firmName: state.firm[index].firmName,
                              firmAddress: state.firm[index].firmAddress,
                              firmId: state.firm[index].firmId,
                            );
                          },
                          firmAddress: state.firm[index].firmAddress,
                          firmGstNumber: state.firm[index].firmGstNumber,
                        );
                      },
                      itemCount: state.firm.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ),
            );
          }
          return FirmLoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddFirmBottomsheet();
        },
        child: Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }
}
