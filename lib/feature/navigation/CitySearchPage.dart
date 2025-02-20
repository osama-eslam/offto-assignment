import 'package:flutter/material.dart';
import 'package:hotel_booking_app/api/CityService.dart';
import 'package:hotel_booking_app/generated/l10n.dart';
import 'package:hotel_booking_app/widget/city/city_list.dart';
import 'package:hotel_booking_app/widget/city/city_search_bar.dart';

class CitySearchModal extends StatefulWidget {
  const CitySearchModal({super.key});

  @override
  _CitySearchModalState createState() => _CitySearchModalState();
}

class _CitySearchModalState extends State<CitySearchModal> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<Map<String, String>> _cities = [];

  void _searchCities() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String searchTerm = _searchController.text.trim();
      if (searchTerm.isEmpty) {
        setState(() {
          _cities = [];
          _isLoading = false;
        });
        return;
      }

      List<Map<String, String>> cities =
          await CityService.fetchCities(searchTerm);
      setState(() {
        _cities = cities;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error fetching cities')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Container(
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? Colors.grey[900]
              : const Color(0xFFE6F5F5),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).travelTo,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00B4B9)),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CitySearchBar(
                controller: _searchController, onSearch: _searchCities),
            const SizedBox(height: 10),
            _isLoading ? const LinearProgressIndicator() : Container(),
            const SizedBox(height: 10),
            Expanded(child: CityList(cities: _cities)),
          ],
        ),
      ),
    );
  }
}
