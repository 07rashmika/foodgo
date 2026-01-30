import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodgo/models/burger.dart';
import 'package:http/http.dart' as http;

class BurgerApi {
  static String get _apiKey => dotenv.env['API_KEY'] ?? '';
  static String get _apiHost => dotenv.env['API_HOST'] ?? '';
  static String baseUrl = 'https://burgers-hub.p.rapidapi.com';

  static Map<String, String> headers = {
    'X-Rapidapi-Key': _apiKey,
    'X-Rapidapi-Host': _apiHost,
  };

  Future<List<Burger>> getBurgers() async {
    var url = Uri.parse('$baseUrl/burgers');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        if (data is List) {
          return data.map((json) => Burger.fromJson(json)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception("error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Exception: $e");
    }
  }
}
