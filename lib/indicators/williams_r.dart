class WilliamsR {
  /// %R değeri
  final double value;

  WilliamsR({required this.value});

  /// Williams %R hesaplama
  static WilliamsR calculate({
    required List<double> high,
    required List<double> low,
    required List<double> close,
    int period = 14,
  }) {
    if (high.length < period || low.length < period || close.length < period) {
      throw ArgumentError('Yetersiz veri: $period periyot için yeterli veri yok.');
    }

    final recentHigh = high.sublist(high.length - period).reduce((a, b) => a > b ? a : b);
    final recentLow = low.sublist(low.length - period).reduce((a, b) => a < b ? a : b);
    final latestClose = close.last;

    final wr = -100 * (recentHigh - latestClose) / (recentHigh - recentLow == 0 ? 1 : recentHigh - recentLow);

    return WilliamsR(value: wr);
  }
}
