import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isSugarFree;
  final bool isSodiumFree;
  final bool isNutFree;
  final bool isSesameFree;
  final bool isTransFatFree;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isSugarFree,
    @required this.isSodiumFree,
    @required this.isNutFree,
    @required this.isSesameFree,
    @required this.isTransFatFree,

  });
}
