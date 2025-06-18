import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_delete_confirmation_bottom_sheet.dart';
import 'package:new_billing/core/widgets/app_empty_widget.dart';
import 'package:new_billing/core/widgets/app_error_widget.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/bank/presentation/cubit/add_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/cubit/delete_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/cubit/fetch_bank_cubit.dart';
import 'package:new_billing/features/bank/presentation/widgets/add_bank_form.dart';
import 'package:new_billing/features/bank/presentation/widgets/bank_loading_widget.dart';
import 'package:new_billing/features/bank/presentation/widgets/bank_tile.dart';
import 'package:new_billing/init_dependencies.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankAccountHolderNameController =
      TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  final TextEditingController _bankIfscCodeController = TextEditingController();
  final TextEditingController _bankBranchNameController =
      TextEditingController();

  @override
  void initState() {
    _fetchBank();
    super.initState();
  }

  void _clearControllers() {
    _bankAccountHolderNameController.clear();
    _bankNameController.clear();
    _bankAccountNumberController.clear();
    _bankBranchNameController.clear();
    _bankIfscCodeController.clear();
  }

  void _fetchBank() {
    BlocProvider.of<FetchBankCubit>(context).fetchBanks();
  }

  void _showBankForm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => serviceLocator<AddBankCubit>(),
        child: BlocBuilder<AddBankCubit, AddBankState>(
          builder: (context, state) {
            return BlocListener<AddBankCubit, AddBankState>(
              listener: (context, state) {
                if (state is AddBankSuccessState) {
                  Navigator.pop(context);
                  _fetchBank();
                  _clearControllers();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
                if (state is AddBankFailureState) {
                  Navigator.pop(context);
                  _clearControllers();
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(message: state.message).build(context),
                  );
                }
              },
              child: AddBankForm(
                isLoading: state is AddBankLoadingState,
                bankNameController: _bankNameController,
                bankAccountHolderNameController:
                    _bankAccountHolderNameController,
                bankAccountNumberController: _bankAccountNumberController,
                bankBranchController: _bankBranchNameController,
                bankIfscController: _bankIfscCodeController,
                onPressed: () {
                  BlocProvider.of<AddBankCubit>(context).addBank(
                    bankName: _bankNameController.text,
                    bankAccountNumber: _bankAccountNumberController.text,
                    bankIfscCode: _bankIfscCodeController.text,
                    bankBranchName: _bankBranchNameController.text,
                    bankAccountHolderName:
                        _bankAccountHolderNameController.text,
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
    required String bankAccountHolderName,
    required String bankAccountNumber,
    required String bankId,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => serviceLocator<DeleteBankCubit>(),
          child: BlocConsumer<DeleteBankCubit, DeleteBankState>(
            listener: (context, state) {
              if (state is DeleteBankSuccessState) {
                Navigator.pop(context);
                _fetchBank();
                ScaffoldMessenger.of(context).showSnackBar(
                  AppSnackBar(message: state.message).build(context),
                );
              }
              if (state is DeleteBankFailureState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  AppSnackBar(message: state.message).build(context),
                );
              }
            },
            builder: (context, state) {
              return AppDeleteConfirmationBottomSheet(
                isLoading: state is DeleteBankLoadingState,
                title: bankAccountHolderName,
                subtitle: bankAccountNumber,
                onDeletePressed: () {
                  BlocProvider.of<DeleteBankCubit>(context).deleteBank(
                    bankId: bankId,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banks"),
        actions: [
          IconButton(
            onPressed: () {
              _fetchBank();
            },
            icon: Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FetchBankCubit, FetchBankState>(
        builder: (context, state) {
          if (state is FetchBankLoadingState) {
            return BankLoadingWidget();
          }
          if (state is FetchBankFailureState) {
            return AppErrorWidget(
              errorMessage: state.message,
              onPressed: () {
                _fetchBank();
              },
            );
          }
          if (state is FetchBankSuccessState && state.bank.isEmpty) {
            return AppEmptyWidget(
              errorMessage: "No Banks To Display",
              onPressed: () {
                _fetchBank();
              },
            );
          }
          if (state is FetchBankSuccessState) {
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
                          "Bank's",
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
                          "Already Exesting Bank's",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return BankTile(
                          bankName: state.bank[index].bankName,
                          bankAccountNumber:
                              state.bank[index].bankAccountNumber,
                          onDeletePressed: () {
                            _showDeleteBottomsheet(
                              bankAccountHolderName: state.bank[index].bankName,
                              bankAccountNumber:
                                  state.bank[index].bankAccountNumber,
                              bankId: state.bank[index].bankId,
                            );
                          },
                          bankBranch: state.bank[index].bankBranchName,
                          bankHolderName:
                              state.bank[index].bankAccountHolderName,
                          bankIfscCode: state.bank[index].bankIfscCode,
                        );
                      },
                      itemCount: state.bank.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ),
            );
          }
          return BankLoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBankForm();
        },
        child: Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }
}
