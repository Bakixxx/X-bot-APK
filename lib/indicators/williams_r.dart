class WilliamsR {
  double calculateWilliamsR(
    List<double> high,
    List<double> low,
    List<double> close,
    int period,
  ) {
    if (high.length < period ||
        low.length < period ||
        close.length < period) {
      throw ArgumentError('Veri sayısı, periyottan az olmamalı');
    }

    double highestHigh = high.sublist(high.length - period).reduce((a, b) => a > b ? a : b);
    double lowestLow = low.sublist(low.length - period).reduce((a, b) => a < b ? a : b);
    double currentClose = close.last;

    return ((highestHigh - currentClose) / (highestHigh - lowestLow)) * -100;
  }
}
