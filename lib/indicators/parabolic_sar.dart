class ParabolicSAR {
  final double accelerationFactor;
  final double maxAccelerationFactor;

  ParabolicSAR({
    this.accelerationFactor = 0.02,
    this.maxAccelerationFactor = 0.2,
  });

  List<double?> calculate(List<double> highs, List<double> lows) {
    List<double?> sar = List.filled(highs.length, null);
    bool isUpTrend = true;
    double af = accelerationFactor;
    double ep = highs[0];
    double prevSar = lows[0];

    for (int i = 1; i < highs.length; i++) {
      if (isUpTrend) {
        if (highs[i] > ep) {
          ep = highs[i];
          af = (af + accelerationFactor).clamp(0, maxAccelerationFactor);
        }

        double currentSar = prevSar + af * (ep - prevSar);
        currentSar = currentSar > lows[i - 1] ? lows[i - 1] : currentSar;
        sar[i] = currentSar;

        if (lows[i] < currentSar) {
          isUpTrend = false;
          af = accelerationFactor;
          ep = lows[i];
          prevSar = highs[i];
          sar[i] = prevSar;
        } else {
          prevSar = currentSar;
        }
      } else {
        if (lows[i] < ep) {
          ep = lows[i];
          af = (af + accelerationFactor).clamp(0, maxAccelerationFactor);
        }

        double currentSar = prevSar + af * (ep - prevSar);
        currentSar = currentSar < highs[i - 1] ? highs[i - 1] : currentSar;
        sar[i] = currentSar;

        if (highs[i] > currentSar) {
          isUpTrend = true;
          af = accelerationFactor;
          ep = highs[i];
          prevSar = lows[i];
          sar[i] = prevSar;
        } else {
          prevSar = currentSar;
        }
      }
    }

    return sar;
  }
}
