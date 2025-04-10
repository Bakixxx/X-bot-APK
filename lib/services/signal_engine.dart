import 'dart:math';
import 'package:x_bot/indicators/adx.dart';
import 'package:x_bot/indicators/cci.dart';
import 'package:x_bot/indicators/cmf.dart';
import 'package:x_bot/indicators/donchian_channels.dart';
import 'package:x_bot/indicators/elliott_wave.dart';
import 'package:x_bot/indicators/fibonacci.dart';
import 'package:x_bot/indicators/ichimoku.dart';
import 'package:x_bot/indicators/parabolic_sar.dart';
import 'package:x_bot/indicators/pivot_points.dart';
import 'package:x_bot/indicators/williams_r.dart';

class SignalEngine {
  Future<String> generateSignal(String symbol) async {
    // Sahte veri örneği (gerçek veriler Binance API ile çekilmeli)
    List<double> closePrices = List.generate(100, (index) => 50000 + Random().nextInt(1000) - 500);
    List<double> highPrices = List.generate(100, (index) => closePrices[index] + Random().nextDouble() * 100);
    List<double> lowPrices = List.generate(100, (index) => closePrices[index] - Random().nextDouble() * 100);
    List<double> volumes = List.generate(100, (index) => 1000 + Random().nextDouble() * 100);

    final ichimoku = Ichimoku().calculate(highPrices, lowPrices, closePrices);
    final sar = ParabolicSAR().calculate(highPrices, lowPrices);
    final adx = ADX().calculate(highPrices, lowPrices, closePrices, 14);
    final fib = FibonacciRetracement().calculate(closePrices.last, highPrices.last, lowPrices.last);
    final cci = CCI().calculate(closePrices, highPrices, lowPrices, 20);
    final pivot = PivotPoints().calculate(highPrices.last, lowPrices.last, closePrices.last);
    final donchian = DonchianChannels().calculate(highPrices, lowPrices, 20);
    final cmf = CMF().calculate(closePrices, highPrices, lowPrices, volumes, 20);
    final williams = WilliamsR().calculate(highPrices, lowPrices, closePrices, 14);
    final ewo = ElliottWaveOscillator().calculate(closePrices);

    int buyScore = 0;
    int sellScore = 0;

    // Basit strateji örnekleri
    if (sar.last < closePrices.last) buyScore++; else sellScore++;
    if (adx > 20) buyScore++; else sellScore++;
    if (cci > 100) buyScore++; else if (cci < -100) sellScore++;
    if (cmf > 0) buyScore++; else sellScore++;
    if (williams > -20) buyScore++; else if (williams < -80) sellScore++;
    if (ewo.last > 0) buyScore++; else sellScore++;

    if (buyScore > sellScore) {
      return 'AL';
    } else if (sellScore > buyScore) {
      return 'SAT';
    } else {
      return 'BEKLE';
    }
  }

  void processSignal() async {
    String signal = await generateSignal('BTCUSDT');
    print("Oluşturulan Sinyal: $signal");
    // Burada API ile al/sat işlemi tetiklenebilir
  }
}
