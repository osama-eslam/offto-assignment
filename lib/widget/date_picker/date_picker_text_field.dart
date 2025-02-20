import 'package:flutter/material.dart';

class DatePickerTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const DatePickerTextField({
    required this.label,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
        filled: true,
        fillColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.calendar_today,
          size: 18,
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
      ),
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}
