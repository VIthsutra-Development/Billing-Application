import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> list;
  final TextEditingController dropDownController;
  const CustomDropDown(
      {super.key, required this.list, required this.dropDownController});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = "Select";

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      controller: widget.dropDownController,
      width: MediaQuery.of(context).size.width,
      initialSelection: widget.list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
