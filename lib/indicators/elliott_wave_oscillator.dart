class ElliottWaveOscillator {
  List<double> calculateEWO(List<double> closePrices, {int fastPeriod = 5, int slowPeriod = 35}) {
    if (closePrices.length < slowPeriod) {
      throw ArgumentError('Yeterli veri yok. En az $slowPeriod kapanış fiyatı gerekiyor.');
    }

    List<double> ewo = [];
    List<double> fastEMA = _calculateEMA(closePrices, fastPeriod);
    List<double> slowEMA = _calculateEMA(closePrices, slowPeriod);

    for (int i = 0; i < slowEMA.length; i++) {
      ewo.add(fastEMA[i + (slowPeriod - fastPeriod)] - slowEMA[i]);
    }

    return ewo;
  }

  List<double> _calculateEMA(List<double> prices, int period) {
    List<double> ema = [];
    double multiplier = 2 / (period + 1);

    double sum = 0;
    for (int i = 0; i < period; i++) {
      sum += prices[i];
    }
    double firstEMA = sum / period;
    ema.add(firstEMA);

    for (int i = period; i < prices.length; i++) {
      double nextEMA = ((prices[i] - ema.last) * multiplier) + ema.last;
      ema.add(nextEMA);
    }

    return ema;
  }
}
