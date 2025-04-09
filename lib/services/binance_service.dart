import 'dart:convert';
import 'package:http/http.dart' as http;

class BinanceService {
  static Future<String> getSignal() async {
    const url = 'https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final price = double.parse(data['price']);

        if (price < 60000) {
          return 'AL: BTC şu anda $price USD seviyesinde.';
        } else {
          return 'SAT: BTC şu anda $price USD seviyesinde.';
        }
      } else {
        return 'Hata: Binance API yanıt vermiyor.';
      }
    } catch (e) {
      return 'Bağlantı hatası: $e';
    }
  }
}
