import 'package:flutter/material.dart';

const kActiveCardColor = Color(0xFFE9ECEF);
const kInactiveCardColor = Color(0xFFF8F9FA);
const kBottomContainerColor = Colors.black45;
const kBottomContainerHeight = 70.0;

const kLabelStyle = TextStyle(
  fontSize: 18,
  color: Colors.black87,
);

const kNumberStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  color: Colors.black87,
);

const kLargeButtonStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const kTitleStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const kResultStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Color(0x7a24d876)
);

const kBMIStyle = TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const kBodyStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.black87,
);

const Map<String,Color> weightColor = {
  "Underweight" : Color(0x7a33b1e4),
  "Normal" : Color(0x7a94c947),
  "Overweight" : Color(0x86f99929),
  "Obesity" : Color(0x7cc92c33)
};