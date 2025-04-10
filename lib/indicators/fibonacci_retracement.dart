class FibonacciRetracement {
  /// Giriş olarak bir zaman dilimindeki en yüksek ve en düşük fiyatı alır
  /// ve geri çekilme seviyelerini döndürür.
  static Map<String, double> calculate({
    required double high,
    required double low,
  }) {
    double diff = high - low;

    return {
      '23.6%': high - (diff * 0.236),
      '38.2%': high - (diff * 0.382),
      '50.0%': high - (diff * 0.5),
      '61.8%': high - (diff * 0.618),
      '78.6%': high - (diff * 0.786),
    };
  }
}
