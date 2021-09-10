import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/Login/login_screen.dart';
import 'package:flutter_complete_guide/Screens/Signup/signup_screen.dart';
import 'package:flutter_complete_guide/Screens/Welcome/components/background.dart';
import 'package:flutter_complete_guide/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';
import 'package:flutter_complete_guide/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'background1.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background1(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            ),

            Image.asset(
              "images/hii.png",
              height: size.height * 0.4,
            ),
            SvgPicture.asset(
              "assets/icons/logo.svg",
              height: size.height * 0.15,
            ),
            Text(
              "",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(

                      color: Color(0xFF74C69D),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)
              ),
            ),
            Text(
              "Kickstart your Safe Eating Journey",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(

                      color: Color(0xFF52B788),
                      fontSize: 13,
                      fontWeight: FontWeight.w600)
              ),
            ),
            SizedBox(
              height: 3,

            ),


            SizedBox(height: size.height * 0.07),

            RoundedButton(
              text: "Get Started",
              color: Color(0xFF6E6D72),
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
