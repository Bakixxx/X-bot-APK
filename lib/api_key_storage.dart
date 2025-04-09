import 'package:shared_preferences/shared_preferences.dart';

class ApiKeyStorage {
  static const _apiKeyKey = 'api_key';
  static const _secretKeyKey = 'secret_key';

  static Future<void> saveKeys(String apiKey, String secretKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiKeyKey, apiKey);
    await prefs.setString(_secretKeyKey, secretKey);
  }

  static Future<Map<String, String?>> loadKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'apiKey': prefs.getString(_apiKeyKey),
      'secretKey': prefs.getString(_secretKeyKey),
    };
  }

  static Future<void> clearKeys() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_apiKeyKey);
    await prefs.remove(_secretKeyKey);
  }
}
