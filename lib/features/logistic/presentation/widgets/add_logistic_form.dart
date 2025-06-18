import 'package:flutter/material.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/core/widgets/app_text_field_multiline.dart';

class AddLogisticForm extends StatefulWidget {
  final TextEditingController logisticNameController;
  final TextEditingController logisticStateController;
  final TextEditingController logisticStateCode;
  final TextEditingController logisticPhone;
  final TextEditingController logisticGstController;
  final TextEditingController logisticAddressController;
  final VoidCallback onPressed;
  final bool isLoading;
  const AddLogisticForm({
    super.key,
    required this.logisticAddressController,
    required this.logisticGstController,
    required this.logisticNameController,
    required this.logisticPhone,
    required this.logisticStateCode,
    required this.logisticStateController,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  State<AddLogisticForm> createState() => _AddLogisticFormState();
}

class _AddLogisticFormState extends State<AddLogisticForm> {
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
                "Add Logistic",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.logisticNameController,
                hintText: "Logistic Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      maxLength: 30,
                      controller: widget.logisticStateController,
                      hintText: "State",
                      prefixIcon: Icons.location_on,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      maxLength: 2,
                      controller: widget.logisticStateCode,
                      hintText: "State Code",
                      prefixIcon: Icons.pin,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      maxLength: 10,
                      controller: widget.logisticPhone,
                      hintText: "Phone",
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      maxLength: 16,
                      controller: widget.logisticGstController,
                      hintText: "GSTIN",
                      prefixIcon: Icons.password_rounded,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppTextFieldMultiline(
                maxLength: 500,
                controller: widget.logisticAddressController,
                hintText: "Logistic Address",
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
