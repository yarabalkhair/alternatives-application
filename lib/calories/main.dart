
import 'package:flutter_complete_guide/calories/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(CCalculator());

class CCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: InputPage(),
    );
  }
}
