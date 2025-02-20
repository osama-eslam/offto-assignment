import 'package:flutter/material.dart';
import 'package:hotel_booking_app/generated/l10n.dart';

class DatePickerHeader extends StatelessWidget {
  final VoidCallback onClose;

  const DatePickerHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).travelDates,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : const Color(0xFF467AA8),
          ),
        ),
        GestureDetector(
          onTap: onClose,
          child: Icon(
            Icons.close,
            color: isDarkMode ? Colors.white70 : Colors.redAccent,
            size: 28,
          ),
        ),
      ],
    );
  }
}
