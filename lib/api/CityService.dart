import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CityService {
  static const String _url =
      'https://front.test.offto.com.kw/api/v1/get_all_cities';

  static Future<List<Map<String, String>>> fetchCities(String search) async {
    try {
      String language = await getAppLanguage();

      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Accept-Language': language,
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'search': search}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['data'] == null || data['data']['items'] == null) {
          throw Exception('Invalid data format');
        }

        final countries = data['data']['items'];
        List<Map<String, String>> cities = [];

        for (var country in countries) {
          if (country['items'] != null) {
            for (var cityItem in country['items']) {
              if (cityItem['city'] != null) {
                String cityName = cityItem['city']['name'] ?? '';
                String countryName = cityItem['city']['country']?['name'] ?? '';

                if (cityName.isNotEmpty) {
                  cities.add({'name': cityName, 'subtitle': countryName});
                }
              }
            }
          }
        }
        return cities;
      } else {
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching cities: $e");
      throw Exception('Error fetching cities');
    }
  }

  static Future<String> getAppLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('languageCode') ?? 'en';
  }
}
