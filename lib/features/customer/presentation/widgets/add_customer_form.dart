import 'package:flutter/material.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/core/widgets/app_text_field_multiline.dart';

class AddCustomerForm extends StatefulWidget {
  final TextEditingController customerNameController;
  final TextEditingController customerStateController;
  final TextEditingController customerStateCodeController;
  final TextEditingController customerGstInController;
  final TextEditingController customerAddressController;
  final VoidCallback onPressed;
  final bool isLoading;
  const AddCustomerForm({
    super.key,
    required this.customerNameController,
    required this.customerAddressController,
    required this.customerGstInController,
    required this.customerStateController,
    required this.customerStateCodeController,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<AddCustomerForm> createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Customer",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.customerNameController,
                hintText: "Customer Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      maxLength: 30,
                      controller: widget.customerStateController,
                      hintText: "State",
                      prefixIcon: Icons.location_on,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      maxLength: 2,
                      controller: widget.customerStateCodeController,
                      hintText: "State Code",
                      prefixIcon: Icons.pin,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppTextField(
                maxLength: 16,
                controller: widget.customerGstInController,
                hintText: "GSTIN",
                prefixIcon: Icons.password_rounded,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextFieldMultiline(
                maxLength: 500,
                controller: widget.customerAddressController,
                hintText: "Customer Address",
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              AppFilledButton(
                isLoading: widget.isLoading,
                onPressed: widget.onPressed,
                buttonText: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}
