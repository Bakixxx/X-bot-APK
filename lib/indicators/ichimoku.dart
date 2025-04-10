class IchimokuData {
  final double tenkanSen;
  final double kijunSen;
  final double senkouSpanA;
  final double senkouSpanB;
  final double chikouSpan;

  IchimokuData({
    required this.tenkanSen,
    required this.kijunSen,
    required this.senkouSpanA,
    required this.senkouSpanB,
    required this.chikouSpan,
  });
}

class Ichimoku {
  static IchimokuData calculate(List<double> highs, List<double> lows, List<double> closes) {
    int length = highs.length;

    double calculateMid(int period, int offset) {
      final subHighs = highs.sublist(length - period - offset, length - offset);
      final subLows = lows.sublist(length - period - offset, length - offset);
      final highestHigh = subHighs.reduce((a, b) => a > b ? a : b);
      final lowestLow = subLows.reduce((a, b) => a < b ? a : b);
      return (highestHigh + lowestLow) / 2;
    }

    final tenkanSen = calculateMid(9, 0);
    final kijunSen = calculateMid(26, 0);
    final senkouSpanA = (tenkanSen + kijunSen) / 2;
    final senkouSpanB = calculateMid(52, 0);
    final chikouSpan = closes[length - 1 - 26];

    return IchimokuData(
      tenkanSen: tenkanSen,
      kijunSen: kijunSen,
      senkouSpanA: senkouSpanA,
      senkouSpanB: senkouSpanB,
      chikouSpan: chikouSpan,
    );
  }
}
