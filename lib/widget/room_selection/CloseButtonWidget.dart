import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  final VoidCallback onClose;

  const CloseButtonWidget({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      icon: Icon(
        Icons.close,
        color: isDarkMode ? Colors.white60 : const Color(0xFFB9C1C6),
      ),
      onPressed: onClose,
    );
  }
}
