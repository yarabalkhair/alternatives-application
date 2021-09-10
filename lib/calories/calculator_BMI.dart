import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/calories/screens/input_page.dart';

class CalculatorCal {
  final int height;
  final int weight;
  int age;
  Map Activite;
  int radioSelection;
  int calorieBase;
  Gender selectedGender;

// CalculatorCal(selectedGender: selectedGender,height: height, weight: weight ,radioSelection:alevel,age:age);
  CalculatorCal({this.selectedGender, this.height, this.weight ,this.radioSelection,this.age});

  String getcal() {
    if (selectedGender==Gender.male) {
      calorieBase = (66.4730 + (13.7516 * weight) + (5.0033 * height) - (6.7550 * age)).toInt();
    } else {
      calorieBase = (655.0955 + (9.5634 * weight) + (1.8496 * height) - (4.6756 * age)).toInt();
    }
    switch(radioSelection) {
      case 0:
        radioSelection = (calorieBase * 1.2).toInt();
        break;
      case 1:
        radioSelection = (calorieBase * 1.5).toInt();
        break;
      case 2:
        radioSelection = (calorieBase * 1.8).toInt();
        break;
      default:
        radioSelection = calorieBase;
        break;
    }
    return radioSelection.toStringAsFixed(1);
  }







}
