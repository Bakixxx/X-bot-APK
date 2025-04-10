import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class BinanceAPI {
  final String apiKey;
  final String apiSecret;
  final String baseUrl = 'https://api.binance.com';

  BinanceAPI({required this.apiKey, required this.apiSecret});

  Future<Map<String, dynamic>> getAccountInfo() async {
    final endpoint = '/api/v3/account';
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final query = 'timestamp=$timestamp';
    final signature = _generateSignature(query);
    final url = Uri.parse('$baseUrl$endpoint?$query&signature=$signature');

    final response = await http.get(
      url,
      headers: {'X-MBX-APIKEY': apiKey},
    );

    return json.decode(response.body);
  }

  String _generateSignature(String query) {
    var key = utf8.encode(apiSecret);
    var message = utf8.encode(query);
    var hmac = Hmac(sha256, key);
    var digest = hmac.convert(message);
    return digest.toString();
  }
}
