class ADX {
  static List<double> calculate({
    required List<double> highs,
    required List<double> lows,
    required List<double> closes,
    int period = 14,
  }) {
    List<double> dxList = [];
    List<double> adxList = [];

    List<double> trList = [];
    List<double> plusDM = [];
    List<double> minusDM = [];

    for (int i = 1; i < highs.length; i++) {
      double highDiff = highs[i] - highs[i - 1];
      double lowDiff = lows[i - 1] - lows[i];

      double plus = (highDiff > lowDiff && highDiff > 0) ? highDiff : 0;
      double minus = (lowDiff > highDiff && lowDiff > 0) ? lowDiff : 0;

      plusDM.add(plus);
      minusDM.add(minus);

      double tr = [
        (highs[i] - lows[i]).abs(),
        (highs[i] - closes[i - 1]).abs(),
        (lows[i] - closes[i - 1]).abs()
      ].reduce((a, b) => a > b ? a : b);

      trList.add(tr);
    }

    List<double> smoothedTR = _ema(trList, period);
    List<double> smoothedPlusDM = _ema(plusDM, period);
    List<double> smoothedMinusDM = _ema(minusDM, period);

    for (int i = 0; i < smoothedTR.length; i++) {
      double plusDI = 100 * (smoothedPlusDM[i] / smoothedTR[i]);
      double minusDI = 100 * (smoothedMinusDM[i] / smoothedTR[i]);

      double dx = (100 * ((plusDI - minusDI).abs() / (plusDI + minusDI)));
      dxList.add(dx);
    }

    adxList = _ema(dxList, period);
    return adxList;
  }

  static List<double> _ema(List<double> values, int period) {
    List<double> result = [];
    double k = 2 / (period + 1);
    double ema = values.take(period).reduce((a, b) => a + b) / period;

    result.add(ema);
    for (int i = period; i < values.length; i++) {
      ema = values[i] * k + ema * (1 - k);
      result.add(ema);
    }

    return result;
  }
}
