class PivotPoints {
  final double pivot;
  final double resistance1;
  final double resistance2;
  final double resistance3;
  final double support1;
  final double support2;
  final double support3;

  PivotPoints({
    required this.pivot,
    required this.resistance1,
    required this.resistance2,
    required this.resistance3,
    required this.support1,
    required this.support2,
    required this.support3,
  });

  /// Pivot Noktaları Hesaplama (en son mum verilerine göre)
  static PivotPoints calculate({
    required double high,
    required double low,
    required double close,
  }) {
    final pivot = (high + low + close) / 3;
    final r1 = 2 * pivot - low;
    final r2 = pivot + (high - low);
    final r3 = high + 2 * (pivot - low);

    final s1 = 2 * pivot - high;
    final s2 = pivot - (high - low);
    final s3 = low - 2 * (high - pivot);

    return PivotPoints(
      pivot: pivot,
      resistance1: r1,
      resistance2: r2,
      resistance3: r3,
      support1: s1,
      support2: s2,
      support3: s3,
    );
  }
}
