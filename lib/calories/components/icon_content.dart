import 'package:flutter_complete_guide/calories/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;
  const IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Colors.black87,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyle
        )
      ],
    );
  }
}