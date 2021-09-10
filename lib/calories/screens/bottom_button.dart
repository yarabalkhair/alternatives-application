import 'package:flutter_complete_guide/calories/constants.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        press: onTap,
        //child: Container(
        // height: kBottomContainerHeight,
        // width: double.infinity,
        // margin: EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        //  child: Center(
        //   child: Text(
        text: buttonTitle);
  }
}
