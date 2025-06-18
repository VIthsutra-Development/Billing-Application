import 'package:flutter/material.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';

class AddBankForm extends StatefulWidget {
  final TextEditingController bankNameController;
  final TextEditingController bankBranchController;
  final TextEditingController bankAccountNumberController;
  final TextEditingController bankIfscController;
  final TextEditingController bankAccountHolderNameController;
  final VoidCallback onPressed;
  final bool isLoading;
  const AddBankForm({
    super.key,
    required this.bankAccountHolderNameController,
    required this.bankAccountNumberController,
    required this.bankNameController,
    required this.bankBranchController,
    required this.bankIfscController,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<AddBankForm> createState() => _AddBankFormState();
}

class _AddBankFormState extends State<AddBankForm> {
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
                "Add Bank",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.bankNameController,
                hintText: "Bank Name",
                prefixIcon: Icons.abc,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.bankBranchController,
                hintText: "Bank Branch",
                prefixIcon: Icons.location_pin,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextField(
                maxLength: 11,
                controller: widget.bankIfscController,
                hintText: "Bank IFSC Code",
                prefixIcon: Icons.password_rounded,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextField(
                maxLength: 20,
                controller: widget.bankAccountNumberController,
                hintText: "Bank Account Number",
                prefixIcon: Icons.pin,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.bankAccountHolderNameController,
                hintText: "Bank Account Holder Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
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
