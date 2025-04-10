class Ichimoku {
  final List<double> high;
  final List<double> low;

  Ichimoku(this.high, this.low);

  Map<String, double> calculate() {
    double tenkanSen = _average(high.sublist(high.length - 9)) + _average(low.sublist(low.length - 9)) / 2;
    double kijunSen = _average(high.sublist(high.length - 26)) + _average(low.sublist(low.length - 26)) / 2;
    double senkouSpanA = (tenkanSen + kijunSen) / 2;
    double senkouSpanB = (_average(high.sublist(high.length - 52)) + _average(low.sublist(low.length - 52))) / 2;

    return {
      'tenkanSen': tenkanSen,
      'kijunSen': kijunSen,
      'senkouSpanA': senkouSpanA,
      'senkouSpanB': senkouSpanB,
    };
  }

  double _average(List<double> values) {
    return values.reduce((a, b) => a + b) / values.length;
  }
}
