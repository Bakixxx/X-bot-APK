import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.binance.com';

  Future<double?> fetchLatestPrice(String symbol) async {
    final url = Uri.parse('$baseUrl/api/v3/ticker/price?symbol=$symbol');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return double.tryParse(data['price']);
      } else {
        print('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      print('API isteği başarısız: $e');
    }
    return null;
  }
}
