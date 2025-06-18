import 'package:flutter/material.dart';
import 'package:new_billing/core/widgets/app_date_picker.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BillingLoadingWidget extends StatelessWidget {
  const BillingLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
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
                  controller: TextEditingController(),
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
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
                        hintText: "Vehicle Number",
                        prefixIcon: Icons.fire_truck_rounded,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
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
                        dateController: TextEditingController(),
                        hint: "Date Of Supply",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
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
                  controller: TextEditingController(),
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
                  dropDownController: TextEditingController(),
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
                  dropDownController: TextEditingController(),
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
                  dropDownController: TextEditingController(),
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
                  dropDownController: TextEditingController(),
                ),
                SizedBox(
                  height: 20,
                ),
                AppFilledButton(
                  onPressed: () {},
                  buttonText: "Submit",
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
