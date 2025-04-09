import 'package:x_bot/services/trade_executor.dart';

class SignalEngine {
  Future<String> generateSignal() async {
    // Bu kısımda sinyal üretme algoritması olacak
    // Şimdilik rastgele AL veya SAT diyelim (demo)
    final now = DateTime.now().second;
    return now % 2 == 0 ? 'AL' : 'SAT';
  }

  Future<void> processSignal() async {
    final signal = await generateSignal();
    final symbol = 'BTCUSDT';

    final executor = TradeExecutor(
      apiKey: 'BURAYA_API_KEYİNİ_YAZ',
      apiSecret: 'BURAYA_API_SECRETİNİ_YAZ',
    );

    if (signal == 'AL') {
      await executor.executeOrder(symbol, 'BUY', '0.001');
    } else {
      await executor.executeOrder(symbol, 'SELL', '0.001');
    }
  }
}
