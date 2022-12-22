class ConverCost {
  static String getCost(int value) {
    double formatValue = value * 0.001;
    return '${formatValue.toStringAsFixed(2)} €';
  }
}
