import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(homepage());
}

class homepage extends StatelessWidget {

  Widget _selectedCleaning({

    @required Color color,
    @required String tittle,
    @required String subtittle,
  }) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 7.0),
      padding: EdgeInsets.only(left: 15),
      height: 160,
      width: 240,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tittle,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtittle,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  Widget _selectedExtras({
    @required String image,
    @required String name,
  }) {
    return Container
      (
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(255, 255, 255, 0.75),
        image: DecorationImage(image: AssetImage('images/bg.png'),fit: BoxFit.fill),
         // border: Border.all(color: Colors.grey, width: 2)
        
         ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              print("clicked");
            },
            child: Container(
              height: 100,
              decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),

            ),
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // debugShowCheckedModeBanner: false,
     // darkTheme: ThemeData.dark(), // Provide dark theme.
     // themeMode: ThemeMode.system,
      home: Scaffold(
        //backgroundColor: Colors.blueAccent,

        body: Container(
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 0),
                    child: Text(
                      "Features",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        _selectedCleaning(
                          color: Colors.blueGrey,
                          tittle : "Scan",
                          subtittle: 'any ingredient list',
                        ),
                        _selectedCleaning(
                          color: Colors.blueGrey,
                          tittle : "list",
                          subtittle: 'with your needs',
                        ),
                        _selectedCleaning(
                          color: Colors.blueGrey,
                          tittle: "calculate",
                          subtittle: 'your BMI',
                        ),
                        _selectedCleaning(
                          color: Colors.blueGrey,
                          tittle: "calculate",
                          subtittle: 'your daily calories',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:7,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'selected extras',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Container(
                          height: 350,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              _selectedExtras(
                                image: 'images/picture1.png',
                                name: 'camera'
                              ),
                              _selectedExtras(
                                  image: 'images/calculator.jpg',
                                  name: 'calculator'
                              ),
                              _selectedExtras(
                                  image: 'images/list.png',
                                  name: 'list'
                              ),
                              _selectedExtras(
                                  image: 'images/more.png',
                                  name: 'more'
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
