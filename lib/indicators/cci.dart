class CCI {
  double calculateCCI(List<double> high, List<double> low, List<double> close, int period) {
    if (high.length < period || low.length < period || close.length < period) {
      throw ArgumentError('Yetersiz veri: Tüm listeler en az $period veri içermelidir.');
    }

    List<double> typicalPrices = [];
    for (int i = 0; i < period; i++) {
      double tp = (high[i] + low[i] + close[i]) / 3;
      typicalPrices.add(tp);
    }

    double sma = typicalPrices.reduce((a, b) => a + b) / period;

    double meanDeviation = typicalPrices
        .map((tp) => (tp - sma).abs())
        .reduce((a, b) => a + b) / period;

    double currentTP = typicalPrices.last;
    double cci = (currentTP - sma) / (0.015 * meanDeviation);

    return cci;
  }
}
