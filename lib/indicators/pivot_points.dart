class PivotPoints {
  Map<String, double> calculatePivotPoints(double high, double low, double close) {
    double pivot = (high + low + close) / 3;
    double resistance1 = (2 * pivot) - low;
    double support1 = (2 * pivot) - high;
    double resistance2 = pivot + (high - low);
    double support2 = pivot - (high - low);
    double resistance3 = high + 2 * (pivot - low);
    double support3 = low - 2 * (high - pivot);

    return {
      'Pivot': pivot,
      'R1': resistance1,
      'S1': support1,
      'R2': resistance2,
      'S2': support2,
      'R3': resistance3,
      'S3': support3,
    };
  }
}
