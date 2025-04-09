import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class BinanceBot {
  final String apiKey;
  final String secretKey;

  BinanceBot({required this.apiKey, required this.secretKey});

  Future<double?> fetchCurrentPrice(String symbol) async {
    final url = Uri.parse("https://api.binance.com/api/v3/ticker/price?symbol=$symbol");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return double.parse(data['price']);
      } else {
        print("Fiyat verisi alınamadı: ${response.body}");
      }
    } catch (e) {
      print("Hata oluştu: $e");
    }
    return null;
  }

  Future<void> generateSignal(String symbol) async {
    final price = await fetchCurrentPrice(symbol);
    if (price == null) return;

    // Basit sinyal örneği (fiyat 65,000'in altındaysa AL, üstündeyse SAT)
    if (price < 65000) {
      print("$symbol için AL sinyali! Güncel fiyat: $price");
    } else {
      print("$symbol için SAT sinyali! Güncel fiyat: $price");
    }
  }
}
