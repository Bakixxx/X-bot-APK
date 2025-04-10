class FibonacciRetracement {
  Map<String, double> calculateLevels(double high, double low) {
    final difference = high - low;
    return {
      '0.0%': high,
      '23.6%': high - (difference * 0.236),
      '38.2%': high - (difference * 0.382),
      '50.0%': high - (difference * 0.500),
      '61.8%': high - (difference * 0.618),
      '78.6%': high - (difference * 0.786),
      '100.0%': low,
    };
  }
}
