class ADX {
  final int period;

  ADX({this.period = 14});

  Map<String, List<double?>> calculate(List<double> highs, List<double> lows, List<double> closes) {
    List<double?> trList = List.filled(highs.length, null);
    List<double?> plusDM = List.filled(highs.length, null);
    List<double?> minusDM = List.filled(highs.length, null);

    for (int i = 1; i < highs.length; i++) {
      final highDiff = highs[i] - highs[i - 1];
      final lowDiff = lows[i - 1] - lows[i];

      plusDM[i] = (highDiff > lowDiff && highDiff > 0) ? highDiff : 0.0;
      minusDM[i] = (lowDiff > highDiff && lowDiff > 0) ? lowDiff : 0.0;

      final tr = [
        highs[i] - lows[i],
        (highs[i] - closes[i - 1]).abs(),
        (lows[i] - closes[i - 1]).abs()
      ].reduce((a, b) => a > b ? a : b);

      trList[i] = tr;
    }

    List<double?> smoothedTR = _smooth(trList, period);
    List<double?> smoothedPlusDM = _smooth(plusDM, period);
    List<double?> smoothedMinusDM = _smooth(minusDM, period);

    List<double?> plusDI = List.filled(highs.length, null);
    List<double?> minusDI = List.filled(highs.length, null);
    List<double?> dx = List.filled(highs.length, null);
    List<double?> adx = List.filled(highs.length, null);

    for (int i = 0; i < highs.length; i++) {
      if (smoothedTR[i] != null && smoothedTR[i]! != 0) {
        plusDI[i] = 100 * smoothedPlusDM[i]! / smoothedTR[i]!;
        minusDI[i] = 100 * smoothedMinusDM[i]! / smoothedTR[i]!;
        dx[i] = 100 * ((plusDI[i]! - minusDI[i]!).abs()) / (plusDI[i]! + minusDI[i]!);
      }
    }

    List<double?> smoothedDX = _smooth(dx, period);

    for (int i = 0; i < highs.length; i++) {
      adx[i] = smoothedDX[i];
    }

    return {
      'plusDI': plusDI,
      'minusDI': minusDI,
      'adx': adx,
    };
  }

  List<double?> _smooth(List<double?> input, int period) {
    List<double?> output = List.filled(input.length, null);
    double? sum;

    for (int i = 0; i < input.length; i++) {
      if (i < period) {
        sum = (sum ?? 0) + (input[i] ?? 0);
        if (i == period - 1) {
          output[i] = sum! / period;
        }
      } else {
        output[i] = ((output[i - 1] ?? 0) * (period - 1) + (input[i] ?? 0)) / period;
      }
    }

    return output;
  }
}
