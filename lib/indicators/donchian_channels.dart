class DonchianChannels {
  final double upperBand;
  final double lowerBand;
  final double middleBand;

  DonchianChannels({
    required this.upperBand,
    required this.lowerBand,
    required this.middleBand,
  });

  /// Donchian Channels hesaplama
  static DonchianChannels calculate(List<double> highs, List<double> lows, {int period = 20}) {
    if (highs.length < period || lows.length < period) {
      throw ArgumentError('Yetersiz veri: $period periyot için en az $period değer gerekli.');
    }

    final recentHighs = highs.sublist(highs.length - period);
    final recentLows = lows.sublist(lows.length - period);

    final upper = recentHighs.reduce((a, b) => a > b ? a : b);
    final lower = recentLows.reduce((a, b) => a < b ? a : b);
    final middle = (upper + lower) / 2;

    return DonchianChannels(
      upperBand: upper,
      lowerBand: lower,
      middleBand: middle,
    );
  }
}
