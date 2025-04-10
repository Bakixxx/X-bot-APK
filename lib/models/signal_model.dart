class SignalModel {
  final String symbol;
  final String action; // AL, SAT veya BEKLE
  final DateTime timestamp;

  SignalModel({
    required this.symbol,
    required this.action,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'action': action,
        'timestamp': timestamp.toIso8601String(),
      };

  factory SignalModel.fromJson(Map<String, dynamic> json) => SignalModel(
        symbol: json['symbol'],
        action: json['action'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
