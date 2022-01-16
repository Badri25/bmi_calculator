import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain{
   final int height;
  final int weight;

  late double _bmi;
  CalculatorBrain({required this.height, required this.weight});

  String calcBMI(){
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult() {
    if(_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';

  }

  String getInterpretation() {
    if(_bmi>=25)
      return 'Try to exercise more!';
    else if(_bmi>18.5)
      return 'Good job!';
    else
      return 'Eat more!';
  }
}