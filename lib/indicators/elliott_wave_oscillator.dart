class ElliottWaveOscillator {
  List<double> calculate(List<double> closePrices) {
    List<double> ewo = [];
    for (int i = 13; i < closePrices.length; i++) {
      double shortEMA = closePrices.sublist(i - 5, i).reduce((a, b) => a + b) / 5;
      double longEMA = closePrices.sublist(i - 35, i).reduce((a, b) => a + b) / 35;
      ewo.add(shortEMA - longEMA);
    }
    return ewo;
  }
}  
