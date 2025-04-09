import 'dart:convert';
import 'package:http/http.dart' as http;

class BinanceService {
  final String baseUrl = 'https://api.binance.com';

  Future<double?> fetchCurrentPrice(String symbol) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v3/ticker/price?symbol=$symbol'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return double.tryParse(data['price']);
    } else {
      print('Fiyat alınamadı: ${response.body}');
      return null;
    }
  }
}
