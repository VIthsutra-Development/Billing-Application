import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/core/widgets/app_text_field_multiline.dart';

class AddFirmForm extends StatefulWidget {
  final TextEditingController firmNameController;
  final TextEditingController firmPanNumberController;
  final TextEditingController firmGstInController;
  final TextEditingController firmPhoneNumberController;
  final TextEditingController firmEmailController;
  final TextEditingController firmAddressController;
  final TextEditingController firmImagePathController;
  final VoidCallback onPressed;
  final bool isLoading;
  const AddFirmForm({
    super.key,
    required this.firmNameController,
    required this.firmPanNumberController,
    required this.firmGstInController,
    required this.firmPhoneNumberController,
    required this.firmEmailController,
    required this.firmAddressController,
    required this.firmImagePathController,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<AddFirmForm> createState() => _AddFirmFormState();
}

class _AddFirmFormState extends State<AddFirmForm> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(
        () {
          _image = File(pickedFile.path);
          widget.firmImagePathController.text =
              _image != null ? _image!.path : "";
        },
      );
    }
  }

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
                "Firm",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Center(
                  child: Container(
                    decoration: _image == null
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.moderateGrey,
                              style: BorderStyle.solid,
                            ),
                          )
                        : null,
                    child: _image == null
                        ? Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/image.png",
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Upload Your Logo",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                )
                              ],
                            ),
                          )
                        : Image.file(
                            _image!,
                            width: 100,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.firmNameController,
                hintText: "Firm Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      maxLength: 10,
                      controller: widget.firmPanNumberController,
                      hintText: "PAN",
                      prefixIcon: Icons.password_rounded,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      maxLength: 16,
                      controller: widget.firmGstInController,
                      hintText: "GSTIN",
                      prefixIcon: Icons.password_rounded,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppTextField(
                maxLength: 10,
                controller: widget.firmPhoneNumberController,
                hintText: "Firm Phone",
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              AppTextField(
                controller: widget.firmEmailController,
                hintText: "Firm Email",
                prefixIcon: Icons.alternate_email_rounded,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              AppTextFieldMultiline(
                maxLength: 500,
                controller: widget.firmAddressController,
                hintText: "Firm Address",
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
