import 'package:flutter/material.dart';
import 'package:hotel_booking_app/feature/navigation/CitySearchPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? selectedCity;

  void _openCitySearchModal() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => CitySearchModal(),
    );

    if (result != null) {
      setState(() {
        selectedCity = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hotel Booking")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedCity ?? "Select a city",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCitySearchModal,
              child: const Text("Search for a city"),
            ),
          ],
        ),
      ),
    );
  }
}
