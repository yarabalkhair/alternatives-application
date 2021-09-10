import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OCR/LoadDataFromFirestore.dart';
import 'package:flutter_complete_guide/bmicl/main.dart';
import 'package:flutter_complete_guide/calories/main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';
import 'package:flutter/services.dart';
import '../homepage1/main.dart';
import '../OCR/Scan.dart';
class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}



class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
        'title': 'Home',
      },
      {
        'page': CategoriesScreen(),
        'title': 'List',
      },
      {
        'page': ocr_scan(),
        'title': 'Scan',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
      {
        'page': BMICalculator(),
        'title': 'BMI',
      },
      {
        'page': CCalculator(),
        'title': 'Calorie',
      },
    ];
    super.initState();
  }

  _selectPage(int index) async {
    if (index == 2) {
      String selectedTextFromOcr = await const MethodChannel("ocr_scan")
          .invokeMethod("scan");
      // print(selectedTextFromOcr);
      var arr = selectedTextFromOcr.toLowerCase().split('ingredients');
      String finaltext = arr[1];

      //ocr_scan(selectedTextFromOcr: selectedTextFromOcr);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Compair(Ocr: finaltext),

          ));



    }
    setState(() {
      _selectedPageIndex = index;

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        title: Text(_pages[_selectedPageIndex]['title'],
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.w600)),),
       // titleTextStyle: TextStyle(color: Colors.black),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xFFF8F9FA),
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.camera_alt_outlined),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.calculate),
            title: Text('BMI'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.fastfood_rounded),
            title: Text('Calorie'),
          ),
        ],
      ),
    );
  }

}
