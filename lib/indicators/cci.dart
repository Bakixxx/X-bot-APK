import 'dart:math';

class CCI {
  /// CCI (Commodity Channel Index) hesaplama
  /// typicalPrices: her mum için typical price (high + low + close) / 3
  /// period: genelde 14 kullanılır
  static List<double> calculate({
    required List<double> highs,
    required List<double> lows,
    required List<double> closes,
    int period = 14,
  }) {
    List<double> cciValues = [];

    for (int i = 0; i < highs.length; i++) {
      if (i + 1 < period) {
        cciValues.add(0);
        continue;
      }

      List<double> tpList = [];
      for (int j = i + 1 - period; j <= i; j++) {
        double tp = (highs[j] + lows[j] + closes[j]) / 3;
        tpList.add(tp);
      }

      double typicalPrice = tpList.last;
      double sma = tpList.reduce((a, b) => a + b) / period;
      double meanDeviation = tpList
              .map((tp) => (tp - sma).abs())
              .reduce((a, b) => a + b) /
          period;

      double cci = meanDeviation == 0 ? 0 : (typicalPrice - sma) / (0.015 * meanDeviation);
      cciValues.add(cci);
    }

    return cciValues;
  }
}
