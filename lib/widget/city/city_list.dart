import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
  final List<Map<String, String>> cities;

  const CityList({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return cities.isEmpty
        ? const Center(child: Text("No cities found"))
        : ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    const Icon(Icons.location_on, color: Color(0xFF00699B)),
                title: Text(
                  cities[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  cities[index]['subtitle']!,
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pop(context, cities[index]['name']);
                },
              );
            },
          );
  }
}
