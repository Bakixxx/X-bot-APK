import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class BinanceApi {
  final String apiKey = 'SENİN_API_KEYİN';
  final String secretKey = 'SENİN_SECRET_KEYİN';

  final String baseUrl = 'https://api.binance.com';

  Future<void> placeOrder({
    required String symbol,
    required String side,
    required String type,
    required String quantity,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final queryString =
        'symbol=$symbol&side=$side&type=$type&quantity=$quantity&timestamp=$timestamp';

    final signature = Hmac(sha256, utf8.encode(secretKey))
        .convert(utf8.encode(queryString))
        .toString();

    final url = Uri.parse('$baseUrl/api/v3/order?$queryString&signature=$signature');

    final response = await http.post(
      url,
      headers: {
        'X-MBX-APIKEY': apiKey,
      },
    );

    print('Response: ${response.body}');
  }
}
