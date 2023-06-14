class Somar {
  static Somar instance = Somar._(0, 0);

  Somar._(this._numero1, this._numero2);

  late double _numero1 = Somar.instance.getNumero1();
  late double _numero2 = Somar.instance.getNumero2();

  double getNumero1() {
    return _numero1;
  }

  void setNumero1(numero1) {
    _numero1 = numero1;
  }

  double getNumero2() {
    return _numero2;
  }

  void setNumero2(numero2) {
    _numero2 = numero2;
  }
}
