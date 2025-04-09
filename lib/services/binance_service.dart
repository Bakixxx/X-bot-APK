import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class BinanceService {
  final String apiKey = 'BJAP1ro6v4VsCEH50JgkzocDMyzh1QLiysdbIwrcsdVIR7MJe7efxCDpM1IPflhq';
  final String secretKey = 'B2846532';
  final String baseUrl = 'https://api.binance.com';

  Future<String> getAccountInfo() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final queryString = 'timestamp=$timestamp';
    final signature = _generateSignature(queryString);

    final uri = Uri.parse('$baseUrl/api/v3/account?$queryString&signature=$signature');

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
    var key = utf8.encode(secretKey);
    var bytes = utf8.encode(query);

    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
