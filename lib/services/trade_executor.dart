import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

class TradeExecutor {
  final String apiKey;
  final String apiSecret;

  TradeExecutor({required this.apiKey, required this.apiSecret});

  Future<void> executeOrder(String symbol, String side, String quantity) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final queryString =
        'symbol=$symbol&side=$side&type=MARKET&quantity=$quantity&timestamp=$timestamp';

    final signature = Hmac(sha256, utf8.encode(apiSecret))
        .convert(utf8.encode(queryString))
        .toString();

    final url =
        'https://api.binance.com/api/v3/order?$queryString&signature=$signature';

    final headers = {
      'X-MBX-APIKEY': apiKey,
    };

    final response = await http.post(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      print('İşlem başarılı: ${response.body}');
    } else {
      print('İşlem hatası: ${response.body}');
    }
  }
}
