import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtilsCustom {
  static Future<void> showDatePickerGlobal(BuildContext context, TextEditingController controller, Function(DateTime)? onDateSelected) async {
    DateTime selectedDate = DateTime.now();

    try {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );

      if (pickedDate != null) {
        controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);

        // Call the provided callback if available
        onDateSelected?.call(pickedDate);
      }
    } catch (e) {
      print('Exception during date selection: $e');
    }
  }
}
