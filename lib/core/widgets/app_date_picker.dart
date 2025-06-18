import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppDatePicker extends StatefulWidget {
  final TextEditingController dateController;
  final String hint;
  final String? Function(String?)? validator;
  const AppDatePicker({
    super.key,
    required this.dateController,
    required this.hint,
    this.validator,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  Future<void> _showDateDialog(TextEditingController controller) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.blue,
              onSurface: AppColors.blue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        _showDateDialog(widget.dateController);
      },
      readOnly: true,
      controller: widget.dateController,
      validator: widget.validator,
      cursorColor: AppColors.blue,
      cursorHeight: 18,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(Icons.calendar_month_rounded, color: AppColors.blue),
      ),
    );
  }
}
