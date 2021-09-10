import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OCR/history.dart';
import 'package:flutter_complete_guide/homepage1/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screensF/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: <Widget>[
          Container(

            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            color: Color(0xFFF8F9FA),
            child: Text(
              'Menu',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 1,
            child: const DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          buildListTile('Profile', Icons.account_circle_rounded, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/');
            //  Navigator.of(context).pushReplacementNamed(history.routeName);
          }),
          buildListTile('Favorites', Icons.favorite, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('History', Icons.history, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => history(),
                ));
            //  Navigator.of(context).pushReplacementNamed(history.routeName);
          }),
          buildListTile('Restrictions', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
