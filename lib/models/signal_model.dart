class SignalModel {
  final String symbol;
  final String action; // "AL" veya "SAT"
  final double confidence; // Örneğin %80 güven

  SignalModel({
    required this.symbol,
    required this.action,
    required this.confidence,
  });

  @override
  String toString() {
    return 'Sinyal: $symbol, İşlem: $action, Güven: ${confidence.toStringAsFixed(2)}%';
  }
}
