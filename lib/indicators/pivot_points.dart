class PivotPoints {
  final double pivot;
  final double resistance1;
  final double resistance2;
  final double support1;
  final double support2;

  PivotPoints({
    required this.pivot,
    required this.resistance1,
    required this.resistance2,
    required this.support1,
    required this.support2,
  });

  /// Pivot Noktaları hesaplama
  static PivotPoints calculate({
    required double high,
    required double low,
    required double close,
  }) {
    final pivot = (high + low + close) / 3;
    final resistance1 = (2 * pivot) - low;
    final support1 = (2 * pivot) - high;
    final resistance2 = pivot + (high - low);
    final support2 = pivot - (high - low);

    return PivotPoints(
      pivot: pivot,
      resistance1: resistance1,
      resistance2: resistance2,
      support1: support1,
      support2: support2,
    );
  }
}
