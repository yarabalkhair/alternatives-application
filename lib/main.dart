import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import './constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Welcome2/welcome_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp =Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alternatives application',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Welcome2Screen(),
    );
  }
}
