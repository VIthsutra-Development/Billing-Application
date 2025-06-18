import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_date_picker.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_bank_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_customer_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_firm_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/fetch_logistic_cubit.dart';
import 'package:new_billing/features/billing/presentation/cubit/submit_invoice_cubit.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _invoiceNameController = TextEditingController();
  final TextEditingController _invoiceReverseChargeController =
      TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoiceStateCodeController =
      TextEditingController();
  final TextEditingController _invoiceChalanNumberController =
      TextEditingController();
  final TextEditingController _invoiceVehicleNumberController =
      TextEditingController();
  final TextEditingController _invoiceDateOfSupplyController =
      TextEditingController();
  final TextEditingController _invoicePlaceOfSupplyController =
      TextEditingController();
  final TextEditingController _reciverIdController = TextEditingController();
  final TextEditingController _consigneeIdController = TextEditingController();
  final TextEditingController _billerIdController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _invoiceNameController.dispose();
    _invoiceReverseChargeController.dispose();
    _invoiceStateController.dispose();
    _invoiceStateCodeController.dispose();
    _invoiceChalanNumberController.dispose();
    _invoiceVehicleNumberController.dispose();
    _invoiceDateOfSupplyController.dispose();
    _invoicePlaceOfSupplyController.dispose();
    _reciverIdController.dispose();
    _consigneeIdController.dispose();
    _billerIdController.dispose();
    _bankController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fetchDropDownElements();
    super.initState();
  }

  void _fetchDropDownElements() {
    BlocProvider.of<FetchBankCubits>(context).fetchBanks();
    BlocProvider.of<FetchCustomerCubits>(context).fetchCustomers();
    BlocProvider.of<FetchFirmCubits>(context).fetchFirms();
    BlocProvider.of<FetchLogisticCubits>(context).fetchLogistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: BlocListener<SubmitInvoiceCubit, SubmitInvoiceState>(
        listener: (context, state) {
          if (state is SubmitInvoiceSuccessState) {
            Navigator.pushReplacementNamed(context, "/products");
          }
          if (state is SubmitInvoiceFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              AppSnackBar(message: state.message).build(context),
            );
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      "Invoice",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Generate Your Invoice",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    controller: _invoiceNameController,
                    hintText: "Invoice Name",
                    prefixIcon: Icons.edit_document,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _invoiceNumberController,
                          hintText: "Bill Number",
                          prefixIcon: Icons.numbers,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AppTextField(
                          maxLength: 2,
                          controller: _invoiceStateCodeController,
                          hintText: "State Code",
                          prefixIcon: Icons.pin,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextField(
                          maxLength: 13,
                          controller: _invoiceVehicleNumberController,
                          hintText: "Vehicle Number",
                          prefixIcon: Icons.fire_truck_rounded,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: _invoiceChalanNumberController,
                          hintText: "Challan Number",
                          prefixIcon: Icons.document_scanner_rounded,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppDatePicker(
                          dateController: _invoiceDateOfSupplyController,
                          hint: "Date Of Supply",
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: _invoicePlaceOfSupplyController,
                          hintText: "Place",
                          prefixIcon: Icons.location_on,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: _invoiceStateController,
                    hintText: "State",
                    prefixIcon: Icons.map,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Reverse Charge",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppMapDropDown(
                    list: [
                      DropDownElements(
                        id: "Yes",
                        name: "Yes",
                      ),
                      DropDownElements(
                        id: "No",
                        name: "No",
                      ),
                    ],
                    dropDownController: _invoiceReverseChargeController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Firm",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<FetchFirmCubits, FetchFirmState>(
                    builder: (context, state) {
                      return AppMapDropDown(
                        list: state is FetchFirmSuccessState ? state.firms : [],
                        dropDownController: _billerIdController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Logistic",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<FetchLogisticCubits, FetchLogisticState>(
                    builder: (context, state) {
                      return AppMapDropDown(
                        list: state is FetchLogisticSuccessState
                            ? state.logistics
                            : [],
                        dropDownController: _consigneeIdController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Customer",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<FetchCustomerCubits, FetchCustomerState>(
                    builder: (context, state) {
                      return AppMapDropDown(
                        list: state is FetchCustomersSuccessState
                            ? state.customers
                            : [],
                        dropDownController: _reciverIdController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Bank",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<FetchBankCubits, FetchBankState>(
                    builder: (context, state) {
                      return AppMapDropDown(
                        list: state is FetchBankSuccessState ? state.banks : [],
                        dropDownController: _bankController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SubmitInvoiceCubit, SubmitInvoiceState>(
                    builder: (context, state) {
                      return AppFilledButton(
                        onPressed: () {
                          if (_bankController.text.isNotEmpty &&
                              _billerIdController.text.isNotEmpty &&
                              _consigneeIdController.text.isNotEmpty &&
                              _invoiceDateOfSupplyController.text.isNotEmpty &&
                              _invoiceNameController.text.isNotEmpty &&
                              _invoiceNumberController.text.isNotEmpty &&
                              _invoicePlaceOfSupplyController.text.isNotEmpty &&
                              _invoiceReverseChargeController.text.isNotEmpty &&
                              _invoiceStateCodeController.text.isNotEmpty &&
                              _invoiceStateController.text.isNotEmpty &&
                              _reciverIdController.text.isNotEmpty) {
                            BlocProvider.of<SubmitInvoiceCubit>(context)
                                .submitInvoice(
                              bankId: _bankController.text,
                              challanNumber:
                                  _invoiceChalanNumberController.text.isEmpty
                                      ? "No"
                                      : _invoiceChalanNumberController.text,
                              customerId: _reciverIdController.text,
                              vehicleNumber:
                                  _invoiceVehicleNumberController.text.isEmpty
                                      ? "No"
                                      : _invoiceVehicleNumberController.text,
                              dateOfSupply: _invoiceDateOfSupplyController.text,
                              firmId: _billerIdController.text,
                              invoiceName: _invoiceNameController.text,
                              invoiceNumber: _invoiceNumberController.text,
                              logisticId: _consigneeIdController.text,
                              placeOfSupply:
                                  _invoicePlaceOfSupplyController.text,
                              reverseCharge:
                                  _invoiceReverseChargeController.text,
                              state: _invoiceStateController.text,
                              stateCode: _invoiceStateCodeController.text,
                            );
                          }
                        },
                        isLoading: state is SubmitInvoiceLoadingState,
                        buttonText: "Submit",
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
