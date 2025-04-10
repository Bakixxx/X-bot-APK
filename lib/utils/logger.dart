class Logger {
  static void log(String message) {
    final now = DateTime.now().toIso8601String();
    print('[$now] $message');
  }

  static void error(String message, [dynamic error]) {
    final now = DateTime.now().toIso8601String();
    print('[$now] HATA: $message');
    if (error != null) {
      print('[$now] Ayrıntı: $error');
    }
  }
}
