import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_indicators/technical_indicators.dart';

class SignalEngine {
  final String symbol;
  final String interval;
  final int limit;

  SignalEngine({
    this.symbol = 'BTCUSDT',
    this.interval = '1h',
    this.limit = 100,
  });

  Future<List<double>> _fetchClosePrices() async {
    final url =
        'https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval&limit=$limit';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    return data.map<double>((item) => double.parse(item[4])).toList();
  }

  Future<Map<String, dynamic>> _fetchKlines() async {
    final url =
        'https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval&limit=$limit';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    return {
      'highs': data.map<double>((e) => double.parse(e[2])).toList(),
      'lows': data.map<double>((e) => double.parse(e[3])).toList(),
      'closes': data.map<double>((e) => double.parse(e[4])).toList(),
      'opens': data.map<double>((e) => double.parse(e[1])).toList(),
      'volumes': data.map<double>((e) => double.parse(e[5])).toList(),
    };
  }

  Future<String> generateSignal() async {
    final prices = await _fetchClosePrices();
    final klineData = await _fetchKlines();

    final closes = klineData['closes']!;
    final highs = klineData['highs']!;
    final lows = klineData['lows']!;
    final volumes = klineData['volumes']!;
    final opens = klineData['opens']!;

    // İndikatör hesaplamaları
    final ichimoku = Ichimoku().calculate(highs, lows, period: 9);
    final sar = ParabolicSAR().calculate(highs, lows);
    final adx = ADX().calculate(highs, lows, closes, period: 14);
    final cci = CCI().calculate(highs, lows, closes, period: 20);
    final rsi = RSI().calculate(closes, period: 14);
    final donchian = DonchianChannels().calculate(highs, lows, period: 20);
    final pivot = PivotPoints().calculate(highs.last, lows.last, closes.last);
    final fib = FibonacciRetracement().calculate(highs.last, lows.last);
    final cmf = ChaikinMoneyFlow().calculate(highs, lows, closes, volumes, period: 20);
    final williams = WilliamsR().calculate(highs, lows, closes, period: 14);

    // Sinyal değerlendirme (örnek birleştirme stratejisi)
    int buyScore = 0;
    int sellScore = 0;

    if (sar.last < closes.last) buyScore++; else sellScore++;
    if (adx.last > 25) buyScore++;
    if (rsi.last < 30) buyScore++; else if (rsi.last > 70) sellScore++;
    if (cci.last < -100) buyScore++; else if (cci.last > 100) sellScore++;
    if (williams.last < -80) buyScore++; else if (williams.last > -20) sellScore++;
    if (cmf > 0) buyScore++; else sellScore++;
    if (closes.last > donchian['upper']!.last) buyScore++;
    if (closes.last < donchian['lower']!.last) sellScore++;

    // Nihai sinyal
    if (buyScore > sellScore) {
      return 'AL';
    } else if (sellScore > buyScore) {
      return 'SAT';
    } else {
      return 'BEKLE';
    }
  }

  void processSignal() async {
    final signal = await generateSignal();
    print('Oluşturulan sinyal: $signal');
    // İşleme geçme kodu burada entegre edilebilir.
  }
}
