import 'dart:math';

class CalculatorBMI {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBMI({this.height, this.weight});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 30)
      return 'Obese';
    else if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 30)
      return '';
    else if (_bmi > 25)
      return '';
    else if (_bmi > 18.5)
      return '';
    else
      return '';
  }
}
