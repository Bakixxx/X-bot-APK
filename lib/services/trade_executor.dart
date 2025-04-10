import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class TradeExecutor {
  final String apiKey;
  final String secretKey;

  TradeExecutor({required this.apiKey, required this.secretKey});

  Future<void> placeOrder({
    required String symbol,
    required String side, // BUY veya SELL
    required String type, // MARKET, LIMIT vs.
    required String quantity,
  }) async {
    final baseUrl = 'https://api.binance.com';
    final endpoint = '/api/v3/order';

    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final queryString = 'symbol=$symbol&side=$side&type=$type&quantity=$quantity&timestamp=$timestamp';

    final signature = _generateSignature(queryString);
    final url = Uri.parse('$baseUrl$endpoint?$queryString&signature=$signature');

    final headers = {
      'X-MBX-APIKEY': apiKey,
    };

    try {
      final response = await http.post(url, headers: headers);
      print('Yanıt: ${response.body}');
    } catch (e) {
      print('Hata: $e');
    }
  }

  String _generateSignature(String data) {
    final key = utf8.encode(secretKey);
    final bytes = utf8.encode(data);
    final hmac = Hmac(sha256, key);
    return hmac.convert(bytes).toString();
  }
}
