class ChaikinMoneyFlow {
  /// CMF değeri
  final double value;

  ChaikinMoneyFlow({required this.value});

  /// Chaikin Money Flow hesaplama
  static ChaikinMoneyFlow calculate({
    required List<double> high,
    required List<double> low,
    required List<double> close,
    required List<double> volume,
    int period = 20,
  }) {
    if (high.length < period ||
        low.length < period ||
        close.length < period ||
        volume.length < period) {
      throw ArgumentError('Yetersiz veri: $period periyot için yeterli veri yok.');
    }

    double adlNumerator = 0;
    double adlDenominator = 0;

    for (int i = high.length - period; i < high.length; i++) {
      final moneyFlowMultiplier = ((close[i] - low[i]) - (high[i] - close[i])) /
          (high[i] - low[i] == 0 ? 1 : high[i] - low[i]);

      final moneyFlowVolume = moneyFlowMultiplier * volume[i];
      adlNumerator += moneyFlowVolume;
      adlDenominator += volume[i];
    }

    final cmf = adlNumerator / (adlDenominator == 0 ? 1 : adlDenominator);

    return ChaikinMoneyFlow(value: cmf);
  }
}
