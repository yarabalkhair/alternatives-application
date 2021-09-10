import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screensF/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  CategoryItem(this.id, this.title, this.color, this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Container(

        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          //border: Border.all(width: 8),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(

          children: <Widget>[

            Image.asset(
              image,
              width: 50,
            ),
            Text(
              title,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
