import 'package:flutter/material.dart';

import './food_data.dart';
import './screensF/tabs_screen.dart';
import './screensF/meal_detail_screen.dart';
import './screensF/category_meals_screen.dart';
import './screensF/filters_screen.dart';
import './screensF/categories_screen.dart';
import './models/meal.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
     'sugar' : false,
      'soduim': false,
      'nuts' :false,
      'sesame':false,
      'trasfat': false,
  };
  List<Meal> _availableMeals = PRODUCT_LIST;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = PRODUCT_LIST.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['sugar'] && !meal.isSugarFree) {
          return false;
        }
        if (_filters['soduim'] && !meal.isSodiumFree) {
          return false;
        }
        if (_filters['nuts'] && !meal.isNutFree) {
          return false;
        }
        if (_filters['sesame'] && !meal.isSesameFree) {
          return false;
        }
        if (_filters['trasfat'] && !meal.isTransFatFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          PRODUCT_LIST.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Color(0xFFF8F9FA),
        accentColor: Color(0xFFD8F3DC),
        canvasColor: Color(0xFFF8F9FA),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Colors.black54,
            ),
            body2: TextStyle(
              color: Colors.black54,
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
  void printy() async {

  }
}
