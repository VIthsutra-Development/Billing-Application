import 'package:flutter/material.dart';

class CustomMapDropDown extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final TextEditingController dropDownController;
  final String valueKey;
  final String labelKey;
  const CustomMapDropDown({
    super.key,
    required this.list,
    required this.dropDownController,
    required this.valueKey,
    required this.labelKey,
  });

  @override
  State<CustomMapDropDown> createState() => _CustomMapDropDownState();
}

class _CustomMapDropDownState extends State<CustomMapDropDown> {
  String? selectedId; // This will store the selected ID

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      controller: widget.dropDownController,
      width: MediaQuery.of(context).size.width,
      initialSelection: widget.list.isNotEmpty ? widget.list.first[widget.valueKey].toString() : null,
      onSelected: (String? value) {
        setState(() {
          selectedId = value;
        });
        widget.dropDownController.text = value ?? "";
      },
      dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((item) {
        return DropdownMenuEntry<String>(
          value: item[widget.valueKey].toString(),
          label: item[widget.labelKey] ?? "Unknown",
        );
      }).toList(),
    );
  }
}

