import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;

  double _bmi = 0.0;

  CalculatorBrain({required this.height,required this.weight});

  String calculateBMI()
  {
     _bmi = weight / pow(height/100, 2);

     //print(_bmi);

    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >=25 ){
      return 'OverWeight';
    } else if (_bmi > 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }


  String getInterpretation(){
    if (_bmi >=25 ){
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5){
      return 'You have a normal body weight. good job';
    }else{
      return 'You have a lower than normal body weight.you can eat a bit more';
    }
  }

}