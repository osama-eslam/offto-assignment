import 'package:flutter/material.dart';
import 'package:hotel_booking_app/generated/l10n.dart';

class AddRoomButton extends StatelessWidget {
  final int rooms;
  final int adults;
  final Function(String, int) updateCount;

  const AddRoomButton({
    super.key,
    required this.rooms,
    required this.adults,
    required this.updateCount,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextButton.icon(
      onPressed:
          (rooms < 4 && rooms < adults) ? () => updateCount("rooms", 1) : null,
      icon: Icon(
        Icons.add_circle_outline,
        color: isDarkMode ? Colors.teal[300] : const Color(0xFF086D9E),
      ),
      label: Text(
        S.of(context).addAnotherRoom,
        style: TextStyle(
          color: isDarkMode ? Colors.teal[300] : const Color(0xFF086D9E),
        ),
      ),
    );
  }
}
