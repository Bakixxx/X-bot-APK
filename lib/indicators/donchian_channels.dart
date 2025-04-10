class DonchianChannels {
  Map<String, double> calculateDonchianChannels(List<double> highs, List<double> lows, int period) {
    if (highs.length < period || lows.length < period) {
      throw ArgumentError('Veri sayısı, periyottan az olmamalı');
    }

    double upperBand = highs.sublist(highs.length - period).reduce((a, b) => a > b ? a : b);
    double lowerBand = lows.sublist(lows.length - period).reduce((a, b) => a < b ? a : b);
    double middleBand = (upperBand + lowerBand) / 2;

    return {
      'Upper': upperBand,
      'Middle': middleBand,
      'Lower': lowerBand,
    };
  }
}
