import 'trade_executor.dart';

class SignalEngine {
  final BinanceService _binanceService = BinanceService();

  Future<String> generateSignal(String symbol) async {
    final double? price = await _binanceService.fetchCurrentPrice(symbol);

    if (price == null) {
      return 'Veri alınamadı';
    }

    String signal = price < 60000 ? 'AL' : 'SAT';

    // Örnek API anahtarları
    final executor = TradeExecutor(
      apiKey: 'BURAYA_API_KEY_YAZ',
      apiSecret: 'BURAYA_API_SECRET_YAZ',
    );

    if (signal == 'AL') {
      await executor.executeOrder(symbol, 'BUY', '0.001');
    } else {
      await executor.executeOrder(symbol, 'SELL', '0.001');
    }

    return signal;
  }
}
