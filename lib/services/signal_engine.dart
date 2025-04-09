import 'binance_service.dart';

class SignalEngine {
  final BinanceService _binanceService = BinanceService();

  Future<String> generateSignal(String symbol) async {
    final double? price = await _binanceService.fetchCurrentPrice(symbol);

    if (price == null) {
      return 'Veri alınamadı';
    }

    // Basit bir kural: Fiyat 60,000'in altına düşerse AL, üstündeyse SAT
    if (price < 60000) {
      return 'AL';
    } else {
      return 'SAT';
    }
  }
}
