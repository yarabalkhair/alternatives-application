import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/OCR/Scan.dart';
import 'package:flutter_complete_guide/homepage/GridDashboard.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GridDashboard.dart';
//import 'package:home/homepage/griddashboard.dart';
//import '../griddashboard.dart';
//import 'griddashboard.dart';
void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();

}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      // Dashboard(),
      //Chat(),
      //  Profile(),
      // Settings(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to Alternatives",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                // IconButton(
                //  alignment: Alignment.topCenter,
                // icon: Image.asset(
                //   "assets/setting.png",
                //     width: 24,
                //  ),
                //  onPressed: () {},
                //)
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),

    );

  }



}


