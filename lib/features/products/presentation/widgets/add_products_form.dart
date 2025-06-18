import 'package:flutter/material.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';

class AddProductForm extends StatefulWidget {
  final TextEditingController productNameController;
  final TextEditingController productPriceController;
  final TextEditingController productQuantityController;
  final TextEditingController productHSNSACController;
  final TextEditingController productUnitController;
  final VoidCallback onPressed;
  final bool isLoading;
  final List<DropDownElements> list;
  const AddProductForm({
    super.key,
    required this.productHSNSACController,
    required this.productNameController,
    required this.productPriceController,
    required this.productQuantityController,
    required this.productUnitController,
    required this.onPressed,
    this.isLoading = false,
    required this.list,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
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
                "Add Product",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.productNameController,
                hintText: "Product Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppMapDropDown(
                list: widget.list,
                dropDownController: widget.productUnitController,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.productHSNSACController,
                hintText: "HSN/SAC",
                prefixIcon: Icons.shopping_bag,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: widget.productQuantityController,
                      hintText: "Quantity",
                      prefixIcon: Icons.pin,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      controller: widget.productPriceController,
                      hintText: "Unit Price",
                      prefixIcon: Icons.currency_rupee,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppFilledButton(
                isLoading: widget.isLoading,
                onPressed: widget.onPressed,
                buttonText: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
