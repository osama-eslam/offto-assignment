import 'package:flutter/material.dart';
import 'package:hotel_booking_app/generated/l10n.dart';

class CitySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const CitySearchBar(
      {super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: S.of(context).searchForCity,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: theme.brightness == Brightness.dark
            ? Colors.grey[200]
            : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) => onSearch(),
    );
  }
}
