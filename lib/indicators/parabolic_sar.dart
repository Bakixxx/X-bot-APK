class ParabolicSAR {
  static List<double> calculate({
    required List<double> highs,
    required List<double> lows,
    required double step,
    required double maxStep,
  }) {
    List<double> sar = [];
    double af = step;
    bool isUptrend = true;
    double ep = highs[0];
    double psar = lows[0];

    for (int i = 1; i < highs.length; i++) {
      sar.add(psar);

      if (isUptrend) {
        psar = psar + af * (ep - psar);
        if (lows[i] < psar) {
          isUptrend = false;
          psar = ep;
          ep = lows[i];
          af = step;
        } else {
          if (highs[i] > ep) {
            ep = highs[i];
            af = (af + step).clamp(0, maxStep);
          }
        }
      } else {
        psar = psar + af * (ep - psar);
        if (highs[i] > psar) {
          isUptrend = true;
          psar = ep;
          ep = highs[i];
          af = step;
        } else {
          if (lows[i] < ep) {
            ep = lows[i];
            af = (af + step).clamp(0, maxStep);
          }
        }
      }
    }

    return sar;
  }
}
