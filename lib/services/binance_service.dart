import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class BinanceService {
  final String apiKey;
  final String apiSecret;

  BinanceService({required this.apiKey, required this.apiSecret});

  Future<String> getServerTime() async {
    final response = await http.get(Uri.parse('https://api.binance.com/api/v3/time'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['serverTime'].toString();
    } else {
      throw Exception('Server zamanını alamadı: ${response.body}');
    }
  }

  Future<String> getAccountInfo() async {
    final timestamp = await getServerTime();
    final query = 'timestamp=$timestamp';
    final signature = _generateSignature(query);

    final uri = Uri.parse('https://api.binance.com/api/v3/account?$query&signature=$signature');

    final response = await http.get(
      uri,
      headers: {
        'X-MBX-APIKEY': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Hesap bilgisi alınamadı: ${response.body}');
    }
  }

  String _generateSignature(String query) {
    final key = utf8.encode(apiSecret);
    final message = utf8.encode(query);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(message);

    return digest.toString();
  }
}
