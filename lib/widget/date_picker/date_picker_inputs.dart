import 'package:flutter/material.dart';
import 'package:hotel_booking_app/generated/l10n.dart';

class DatePickerInputs extends StatelessWidget {
  final TextEditingController departController;
  final TextEditingController arriveController;

  const DatePickerInputs({
    super.key,
    required this.departController,
    required this.arriveController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _buildDateField(
                context, S.of(context).depart, departController)),
        const SizedBox(width: 10),
        Expanded(
            child: _buildDateField(
                context, S.of(context).arrive, arriveController)),
      ],
    );
  }

  Widget _buildDateField(
      BuildContext context, String label, TextEditingController controller) {
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
        prefixIcon: Icon(Icons.calendar_today,
            color: isDarkMode ? Colors.white70 : Colors.black54),
        contentPadding: const EdgeInsets.all(10),
      ),
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}
