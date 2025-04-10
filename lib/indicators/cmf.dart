class CMF {
  double calculateCMF(
    List<double> high,
    List<double> low,
    List<double> close,
    List<double> volume,
    int period,
  ) {
    if (high.length < period ||
        low.length < period ||
        close.length < period ||
        volume.length < period) {
      throw ArgumentError('Veri sayısı, periyottan az olmamalı');
    }

    double moneyFlowVolumeSum = 0;
    double volumeSum = 0;

    for (int i = high.length - period; i < high.length; i++) {
      final moneyFlowMultiplier =
          ((close[i] - low[i]) - (high[i] - close[i])) / (high[i] - low[i]);
      final moneyFlowVolume = moneyFlowMultiplier * volume[i];
      moneyFlowVolumeSum += moneyFlowVolume;
      volumeSum += volume[i];
    }

    return volumeSum != 0 ? moneyFlowVolumeSum / volumeSum : 0;
  }
}
