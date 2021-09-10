import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OCR/history.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Scan",
      subtitle: "Scan your Products here",
      event: "",
      img: "assets/asset/scan.png"
  );

  Items item2 = new Items(
    title: "List",
    subtitle: "Check our List ",
    event: "",
    img: "assets/asset/list.png",
  );
  Items item3 = new Items(
    title: "Calories",
    subtitle: "Calculate you Calories",
    event: "",
    img: "assets/asset/cal.png",
  );
  Items item4 = new Items(
    title: "BMI",
    subtitle: "Calculate your BMI",
    event: "",
    img: "assets/asset/bmi.png",
  );
  Items item5 = new Items(
    title: "History",
    subtitle: "Past Scanned Products",
    event: "",
    img: "assets/asset/his.png",
  );
  Items item6 = new Items(
    title: "Setting",
    subtitle: "Mange your restrictions",
    event: "",
    img: "assets/asset/settings.png",
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xFFD8F3DC;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 26, right: 26),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: myList.map((data) {


            return Container(

              decoration: BoxDecoration(
                  color: Color(color).withOpacity(0.9), borderRadius: BorderRadius.circular(10)),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),

            );

          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}