
import 'package:flutter/material.dart';
import './models/category.dart';
import './models/meal.dart';
import 'package:firebase_storage/firebase_storage.dart';
const CATEGORIES = const [

  Category(
    id: 'c1',
    title: 'Grains',
    color: Color(0xFFD8F3DC),
    image: 'images/grain-sack.png',

  ),
  Category(
    id: 'c2',
    title: 'Diary',
    color: Color(0xFFD8F3DC),
    image: 'images/dairy-products.png',
  ),
  Category(
    id: 'c3',
    title: 'Snacks',
    color: Color(0xFFD8F3DC),
    image: 'images/snacks.png',
  ),
  Category(
    id: 'c4',
    title: 'Drinks',
    color: Color(0xFFD8F3DC),
    image: 'images/drink.png',
  ),
  Category(
    id: 'c5',
    title: 'Baking',
    color: Color(0xFFD8F3DC),
    image: 'images/bakery.png',
  ),
  Category(
    id: 'c6',
    title: 'Canned Products',
    color: Color(0xFFD8F3DC),
    image: 'images/canned-food.png',
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Color(0xFFD8F3DC),
    image: 'images/breakfast.png',
  ),
  Category(
    id: 'c8',
    title: 'Candies',
    color: Color(0xFFD8F3DC),
    image: 'images/chocolate.png',
  ),

  Category(
    id: 'c9',
    title: 'Meats',
    color: Color(0xFFD8F3DC),
    image: 'images/thanksgiving.png',
  ),

];
Future<Widget>_getImage(BuildContext context, String imgName) async {
  Image image;
  await FireStorageService.loadImage(context, imgName).then((value) => {
    image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    )
  });
  return image;
}


const PRODUCT_LIST = const [
  Meal(
    id: 'm1',
    categories: [
      'c1',

    ],
    title: 'rice',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Frice.png?alt=media&token=9d5ee2a8-5633-4384-a4ab-d0a433f2ff8c',


    ingredients: [
      'rice grains',
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),

  Meal(
    id: 'm2',
    categories: [
      'c1',
      'c7',
    ],
    title: 'White oats ',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fwhite%20oats.png?alt=media&token=a747c140-866b-4ce4-a136-eb8932bb9311',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c9',
    ],
    title: 'chicken breast',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2FScreen%20Shot%202021-03-17%20at%205.45.54%20PM.png?alt=media&token=75a30190-68ee-48e3-8704-98dd9f29e86e',

    ingredients: [
      'chicken breast'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c9',
    ],
    title: 'beef burger',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2FScreen%20Shot%202021-03-17%20at%205.46.15%20PM.png?alt=media&token=2c930a6e-3567-460e-8f07-7b4f7027753b',
    ingredients: [
      'NA'
    ],

    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2',

    ],
    title: 'cheese slices',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Falmarai%20cheese.png?alt=media&token=8141f713-7e83-446d-bf78-1569e80171b7',

    ingredients: [
      'NA'
    ],

    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c2',

    ],
    title: 'low fat cheese slices',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Falmarai%20low%20fat%20cheese.png?alt=media&token=a4becb73-b7ac-4bb6-bae6-6f3cb0d275d0',

    ingredients: [
      '',
    ],

    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c3',
    ],
    title: 'Almonds',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Falmonds.png?alt=media&token=9c4df6dd-3481-442e-a75a-e3b8fbf3486f',
    ingredients: [
      'Almonds',
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c3',
    ],
    title: 'bread bites',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fbread%20bites.png?alt=media&token=23c29d51-7864-4f33-906e-b5009eee8a1d',
    ingredients: [
      '',
    ],

    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c2',
    ],
    title: 'hallomi cheese',

    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fhallomi%20cheese.png?alt=media&token=513b245e-21ed-4880-8386-72526089170d',

    ingredients: [
      '',
    ],

    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),

  Meal(
    id: 'm10',
    categories: [
      'c2',
    ],
    title: 'Labnah',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Flabnah%20.png?alt=media&token=67e536ed-6f58-449d-b1b2-ad39e0d9fa20',

    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm11',
    categories: [
      'c3',
    ],
    title: 'Mixed nuts',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fmixed%20nuts.png?alt=media&token=d97ad8b3-f7d8-4dc8-8e26-196e624e04e3',

    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c3',

    ],
    title: 'Oats cookies',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Foats%20cookies.png?alt=media&token=5bd78034-8eae-47c9-bf45-1b4de9ae9ba4',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm13',
    categories: [
      'c6',
    ],
    title: 'Olive oil',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Folive%20oil.png?alt=media&token=73548f4e-826a-4325-844c-61a20497adb6',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm14',
    categories: [
      'c6',
    ],
    title: 'peanut butter',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fpeanut%20butter.png?alt=media&token=ec4e031b-6e1c-4fcd-b4cc-ac9d011156c4',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: true,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm15',
    categories: [
      'c4',
    ],
    title: 'pepsi',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fpepsi.png?alt=media&token=1b07f760-beee-42cf-a86f-1793df43255e',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm16',
    categories: [
      'c4',
    ],
    title: 'diet pepsi',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fsugar%20free%20pepsi.png?alt=media&token=fceef0ce-7283-4419-a4aa-c2287be1af2c',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm17',
    categories: [
      'c3',
    ],
    title: 'crackes',
    imageUrl:
'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fritz%20crackers.png?alt=media&token=3640a4d5-c982-480a-8f07-47fff385d064',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: false,
    isSugarFree: false,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm18',
    categories: [
      'c6',
    ],
    title: 'tahini',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Ftahini.png?alt=media&token=270c8146-ec93-44f4-9b73-379c1a46e333',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: false,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm19',
    categories: [
      'c6',
      'c9',
    ],
    title: 'tuna',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Ftuna.png?alt=media&token=33680f59-1fcb-43a3-99e4-aad94d7da4aa',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm20',
    categories: [
      'c1',
      'c5',
    ],
    title: 'flour',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/products%2Fwhite%20flour.png?alt=media&token=288615ce-1590-4a65-8a86-43f8a54f0d4c',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm21',
    categories: [
      'c3',
    ],
    title: 'rice cakes',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FBiona%20Organic%20Gluten%20Free%20Rice%20Cake.png?alt=media&token=25b933d9-6aff-41cf-a45c-87be6ecca595',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm22',
    categories: [
      'c1',
      'c5',
    ],
    title: 'bread',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FCeliac%20Gluten%20Free%20Cereal%20Baguettes.png?alt=media&token=921002ce-0025-4b67-af22-a9a317795c01',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm23',
    categories: [
      'c3',
    ],
    title: 'chocolate wafers',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FChocolate%20Wafer.png?alt=media&token=135b710b-dcef-48d1-a342-ed183e9f0c42',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: false,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm25',
    categories: [
      'c3',
    ],
    title: 'chips',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FSimply%207%20Jalapeno%20Lentil%20Chips.png?alt=media&token=ddb860cf-110e-4e0f-a10b-83e0e4570ab4',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm26',
    categories: [
      'c6',
      'c7',
    ],
    title: 'peanut butter',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FSkippy%20Less%20Fat%20Creamy%20Peanut%20Butter%20.png?alt=media&token=cc53de86-53c5-4cdd-aa79-4d840b893c27',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm27',
    categories: [
      'c7',
    ],
    title: 'corn flakes',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/gluten%20free%2FWholesome%20Organic%20Corn%20Flakes.png?alt=media&token=ea8e551c-cd1f-4328-b6ad-dde88fe91048',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm28',
    categories: [
      'c3',
      'c8',
    ],
    title: 'chocolate',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/sugar%20free%2FBelgian%20Dark%20Chocolate.png?alt=media&token=1fa73afa-9e4b-46f9-8b49-27a7399d4684',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm29',
    categories: [
      'c7',
    ],
    title: 'Muesli',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/sugar%20free%2FOrganic%20Muesli%20.png?alt=media&token=5f5bcdbe-c4ce-4dbe-9471-6b759903f315',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:false,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm30',
    categories: [
      'c5',
    ],
    title: 'stevia sugar',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/sugar%20free%2FSteviana%20Sweetener.png?alt=media&token=21de8ebb-b8b0-47e9-b0c3-e5413d74f83a',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm31',
    categories: [
      'c3',
    ],
    title: 'lemon wafer',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/sugar%20free%2FVoortman%20Sugar%20Free%20Lemon%20Wafers.png?alt=media&token=507902fb-2aa3-49ac-886f-65466adb0e2c',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm32',
    categories: [
      'c2',
    ],
    title: 'coconut milk',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.10.54%20PM.png?alt=media&token=6e4a8427-fbd5-41f1-9de4-e48f1d00415c',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm33',
    categories: [
      'c2',
    ],
    title: 'soy milk',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.11.03%20PM.png?alt=media&token=d6886f07-048b-4fc8-a071-bc50d22bc004',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: true,
  ),

  Meal(
    id: 'm34',
    categories: [
      'c2',
    ],
    title: 'coconut yogurt',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.11.22%20PM.png?alt=media&token=1c5046a3-d328-45ac-a84a-d97f392521fa',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm35',
    categories: [
      'c5',
    ],
    title: 'white toast',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.13.03%20PM.png?alt=media&token=ab91b76c-a659-45a0-a0cc-f9a06a807263',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: false,
  ),
  Meal(
    id: 'm36',
    categories: [
      'c5',
    ],
    title: 'brown toast ',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.13.09%20PM.png?alt=media&token=67c411a5-2a39-497b-b1a0-21e1a4b415e9',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm37',
    categories: [
      'c5',
    ],
    title: 'brown tortilla',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.13.20%20PM.png?alt=media&token=050b26f9-7bb5-4034-9d16-e93c9f291079',
    ingredients: [
      ''
    ],

    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm38',
    categories: [
      'c8',
    ],
    title: 'fruit candy',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.14.27%20PM.png?alt=media&token=b5c7a688-0282-40c4-a900-8a1773bdbed9',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: false,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm39',
    categories: [
      'c8',
    ],
    title: 'jolly rancher',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.19.20%20PM.png?alt=media&token=e02bd209-d281-4f70-b7aa-04bca71743db',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
  Meal(
    id: 'm40',
    categories: [
      'c8',
    ],
    title: 'caramel candy',
    imageUrl:
    'https://firebasestorage.googleapis.com/v0/b/alternatives-application-75319.appspot.com/o/file2%2FScreen%20Shot%202021-03-17%20at%207.19.32%20PM.png?alt=media&token=fdc8181a-a256-4239-a10c-cd6176bf2bf6',
    ingredients: [
      ''
    ],

    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    isNutFree:true,
    isSesameFree: true,
    isSodiumFree: true,
    isSugarFree: true,
    isTransFatFree: true,
  ),
];

class FireStorageService extends ChangeNotifier {
  FireStorageService ();
  static Future <dynamic> loadImage(BuildContext context,String Image ) async {

    return await FirebaseStorage.instance.ref( ).child(Image).getDownloadURL() ;
  }

}