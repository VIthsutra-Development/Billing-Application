import 'package:flutter/material.dart';

// Model
class DropDownElements {
  final String id;
  final String name;

  DropDownElements({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownElements &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class AppMapDropDown extends StatefulWidget {
  final List<DropDownElements> list;
  final TextEditingController dropDownController;

  const AppMapDropDown({
    super.key,
    required this.list,
    required this.dropDownController,
  });

  @override
  State<AppMapDropDown> createState() => _AppMapDropDownState();
}

class _AppMapDropDownState extends State<AppMapDropDown> {
  DropDownElements? selectedItem;

  @override
  void initState() {
    super.initState();

    if (widget.dropDownController.text.isNotEmpty) {
      selectedItem = widget.list.firstWhere(
        (item) => item.id == widget.dropDownController.text,
        orElse: () => widget.list.first,
      );
    } else if (widget.list.isNotEmpty) {
      selectedItem = widget.list.first;
      widget.dropDownController.text = selectedItem!.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DropDownElements>(
      value: selectedItem,
      decoration: InputDecoration(
        hintText: "Select Item",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: widget.list.map((item) {
        return DropdownMenuItem<DropDownElements>(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: (DropDownElements? newValue) {
        setState(() {
          selectedItem = newValue;
        });
        if (newValue != null) {
          widget.dropDownController.text = newValue.id;
        }
      },
    );
  }
}
