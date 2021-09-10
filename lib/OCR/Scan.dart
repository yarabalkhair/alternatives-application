import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_complete_guide/screensF/tabs_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(ocr_scan());
}

class ocr_scan extends StatelessWidget {
  // final List<String> list1;
  // final String scanned;
  //final String db;
  //final String type;

  ocr_scan({List<String> entries}) : this.entries = entries ?? [];
  final List<String> entries;


// ocr_scan scan1= ocr_scan.;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  bool tt() {
      for(int i=0; i<=entries.length;i++){
        if(entries[i]=='done'){
          print(entries[i]);
          return true;
        }
      }

     /* if (type.isNotEmpty) {
        //print('here');
        // for(int i=0;i<=entries.length;i++){
        if (type.contains('SugarFree')) {
          var x = 'contains sugar';
          entries1.add(x);
        }
        if (type.contains('glutenFree')) {
          var x = 'contains gluten';
          entries1.add(x);
        }
        if (type.contains('lactoseFree')) {
          var x = 'contains lactose';
          entries1.add(x);
        }
        if (type.contains('vegan')) {
          var x = 'non-vegan';
          entries1.add(x);
        }
        if (type.contains('vegetarian')) {
          var x = ' non-vegetarian';
          entries1.add(x);
        }
        if (type.contains('SodiumFree')) {
          var x = 'contains Sodium';
          entries1.add(x);
        }
        if (type.contains('NutFree')) {
          var x = 'contains Nut';
          entries1.add(x);
        }
        if (type.contains('SesameFree')) {
          var x = 'contains Sesame';
          entries1.add(x);
        }
        if (type.contains('TransFatFree')) {
          var x = 'containsTransFat';
          entries1.add(x);
        }
        if (entries1.isEmpty) {
          entries1.add('this product is safe');
        }
      }   */
    }

      Widget build(BuildContext context) {

  return Container(
    height: 0,
    width: 0,
  );

     }
 // }
}


