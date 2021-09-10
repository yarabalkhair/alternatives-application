import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OCR/Scan.dart';
import 'package:google_fonts/google_fonts.dart';

class Compair extends StatefulWidget {
  final String Ocr;

  const Compair({Key key, this.Ocr}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(this.Ocr);
}

class _HomePageState extends State<Compair> {
  final String Ocr;
  _HomePageState(this.Ocr);


  Future<dynamic> result(String code) async {
    final List<String> entries = [];
    //USER RESTRICTIONS
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (int j = 0; j <= snapshot.docs.length - 1; j++) {
      if (snapshot.docs[j].id == code) {
        DocumentSnapshot e = await FirebaseFirestore.instance
            .collection('users')
            .doc(code)
            .get();
        // String
        var arr = e.data()['restriction'].toString().split('{');
        var arr1 = arr.toString().split('}');
        var arr2 = arr1.toString().split(':');
        var arr3 = arr2.toString().split(',');

        for (int i = 0; i <= arr3.length; i++) {
          if (i % 2 != 0) {
            //RESTRICTIONS
            QuerySnapshot snapshot1 = await FirebaseFirestore.instance
                .collection('Restrictions')
                .get();

            for (int y = 0; y <= snapshot1.docs.length - 1; y++) {
              String x = ' ' + snapshot1.docs[y].id.toString();

              String f = arr3[i].toString();
              if (f == x) {
                var ar = arr3[i].split(' ');
                DocumentSnapshot e2 = await FirebaseFirestore.instance
                    .collection('Restrictions')
                    .doc(ar[1])
                    .get();
                var ar0 = e2.data()['name'].toString().replaceAll('{', ',');
                var ar1 = ar0.toString().replaceAll('}', ',');
                var ar2 = ar1.toString().replaceAll(':', ',');
                var ar3 = ar2.toString().split(',');

                for (int i3 = 0; i3 <= ar3.length - 1; i3++) {
                  if (i3 % 2 == 0) {
                    //gg=restrictions
                    var gg = ar3[i3].replaceFirst(' ', '');
                    if (gg.isNotEmpty) {
                      gg = gg.toLowerCase();
                      var a11 = Ocr.replaceAll('(', ',');
                      var a111 = a11.replaceAll(')', ',');
                      var a1111 = a111.replaceAll('.', ',');
                      var a2 = a1111.replaceAll('[', ',');
                      var a22 = a2.replaceAll(']', ',');
                      var a0 = a22.toString().split(',');

                      for (int i2 = 0; i2 <= a0.length - 1; i2++) {

                        if (a0[i2].isNotEmpty) {
                          var ocr = a0[i2].replaceFirst(' ', '');
                          //final scan
                          ocr = ocr.toLowerCase();

                          var count = 0;
                          //final compair
                          if (ocr.contains(gg)) {

                            print('yessssssssssssss');


                            if (x.contains('SugarFree')) {
                              var x1 = 'Sugar => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('glutenFree')) {
                              var x1 = 'Gluten => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('lactoseFree')) {
                              var x1 = 'Lactose => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('vegan')) {
                              var x1 = 'Non-Vegan => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('vegetarian')) {
                              var x1 = 'Non-Vegetarian => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('SodiumFree')) {
                              var x1 = 'Sodium => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('NutFree')) {
                              var x1 = 'Nut => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('SesameFree')) {
                              var x1 = 'Sesame => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            if (x.contains('TransFatFree')) {
                              var x1 = 'TransFat => ' + gg;
                              entries.add(x1);
                              result1(x1, count);
                            }
                            // if (entries1.isEmpty) {
                            //  entries1.add('this product is safe');
                            //   }
                            count++;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (entries.isEmpty) {
      entries.add('This Product is Safe');
    }
    print('out');

    // entries.add('done');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyPage(entries: entries),
        ));
  }
//history
  Future<dynamic> result1(String x, int t) async {
    var current_user = FirebaseAuth.instance.currentUser;
    var now = DateTime.now();
    var time = (now.day.toString() +
            '-' +
            now.month.toString() +
            '-' +
            now.year.toString())
        .toString();

    FirebaseFirestore.instance.collection('users').doc(current_user.uid).set({
      'history': {
        'time': time,
        'scan': Ocr,
        'result': {t.toString(): x}
      }
    }, SetOptions(merge: true));
  }

  Widget build(BuildContext context) {
    var current_user = FirebaseAuth.instance.currentUser;
    result(current_user.uid.toString());

try{
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Result", style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w600)),),
        // backgroundColor: ,
      ),
      body: Center(
          child: Text(
            'loading...',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 8,
                  wordSpacing: 20,
                )),

            // backgroundColor: Colors.yell
          )),
    );
  }catch(TimeoutException){
    print("the waiting time took longer than usual");
  print(TimeoutException.toString());
    throw 'Timeout Exception';
  }
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key key, List<String> entries}) : this.entries = entries;
  final List<String> entries;

  //final String code;
  @override
  Widget build(BuildContext context) {
    var colorx= Color(0x7cc92c33);

    if (entries[0] == 'This Product is Safe') {
      colorx = Color(0x7a94c947);
    } else {
      Color(0x7cc92c33);
    }

    // print(now.);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Result",style: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: Colors.black87,
              fontSize: 25,
              fontWeight: FontWeight.w600)),)),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          //print(index);
          return Container(
            height: 50,
            color: colorx,
            child: Center(
                child: Text(
              '${entries[index]}',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
