import 'package:flutter/foundation.dart';
import '../indicators/ichimoku.dart';
import '../indicators/ewo.dart';
import '../indicators/parabolic_sar.dart';
import '../indicators/adx.dart';
import '../indicators/fibonacci.dart';
import '../indicators/cci.dart';
import '../indicators/pivot_points.dart';
import '../indicators/donchian_channels.dart';
import '../indicators/cmf.dart';
import '../indicators/williams_r.dart';

class SignalEngine {
  Future<String> generateSignal(String symbol) async {
    try {
      // Sadece örnek veriler - Gerçek API ile değiştirilecek
      List<double> closes = [102, 105, 108, 107, 110, 112, 114, 113, 116, 118];
      List<double> highs = [103, 106, 110, 109, 112, 113, 116, 115, 117, 119];
      List<double> lows = [100, 104, 106, 105, 109, 110, 113, 111, 114, 116];
      List<double> volumes = [5000, 6000, 5500, 5800, 6100, 6200, 6300, 6400, 6500, 6600];

      // Ichimoku
      final ichimoku = Ichimoku.calculate(closes, highs, lows);

      // EWO
      final ewo = EWO.calculate(closes);

      // Parabolic SAR
      final parabolicSar = ParabolicSAR.calculate(highs, lows);

      // ADX
      final adx = ADX.calculate(highs, lows, closes);

      // Fibonacci
      final fibonacci = Fibonacci.calculate(closes.last, closes);

      // CCI
      final cci = CCI.calculate(closes, highs, lows, 14);

      // Pivot Points
      final pivot = PivotPoints.calculate(highs, lows, closes);

      // Donchian Channels
      final donchian = DonchianChannels.calculate(highs, lows, 20);

      // CMF
      final cmf = CMF.calculate(highs, lows, closes, volumes, 20);

      // Williams %R
      final williams = WilliamsR.calculate(closes, highs, lows, 14);

      // STRATEJİLER
      if (closes.last > ichimoku.senkouSpanA && adx.adx > 25 && cmf > 0 && williams > -20) {
        return "AL - Güçlü trend yukarı";
      } else if (closes.last < ichimoku.senkouSpanB && adx.adx > 25 && cmf < 0 && williams < -80) {
        return "SAT - Güçlü trend aşağı";
      } else if (ewo > 0 && closes.last > donchian.upperBand) {
        return "AL - Kırılma yukarı";
      } else if (ewo < 0 && closes.last < donchian.lowerBand) {
        return "SAT - Kırılma aşağı";
      } else {
        return "NÖTR - Belirsiz sinyal";
      }
    } catch (e) {
      return 'Sinyal üretme hatası: \$e';
    }
  }

  void processSignal() async {
    String signal = await generateSignal("BTCUSDT");
    debugPrint("Üretilen sinyal: \$signal");
  }
}
