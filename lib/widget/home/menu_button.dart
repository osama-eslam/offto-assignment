import 'package:flutter/material.dart';
import 'package:hotel_booking_app/feature/settings/settings.dart';

class MenuButton extends StatelessWidget {
  final Function(String) changeLanguage;

  const MenuButton({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF00B9C3);

    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(Icons.menu, size: 32, color: iconColor),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsPage(
                changeLanguage: changeLanguage,
              ),
            ),
          );
        },
      ),
    );
  }
}
