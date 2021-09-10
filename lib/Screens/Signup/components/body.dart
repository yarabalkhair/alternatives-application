import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/Login/login_screen.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/add_to.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/background.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/or_divider.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/restrictions_signup.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/social_icon.dart';
import 'package:flutter_complete_guide/Screens/Signup/signup_screen.dart';
import 'package:flutter_complete_guide/components/already_have_an_account_acheck.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';
import 'package:flutter_complete_guide/components/rounded_input_field.dart';
import 'package:flutter_complete_guide/components/rounded_password_field.dart';
import 'package:flutter_complete_guide/Screens/Signup/components/getdata.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _formkey = GlobalKey<FormState>();


class Body extends StatelessWidget {
  @override
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final usersRef = FirebaseFirestore.instance.collection('users');
  Widget build(BuildContext context) {



    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/logo.svg",
                height: size.height * 0.35,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Fill Name Input';
                  }
                },
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Fill Email Input';
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Fill Password Input';
                  }
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
                  if(_formkey.currentState.validate()){
                    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

                    if(result != null)
                    {

                      var userInfo = FirebaseFirestore.instance.collection('users').doc(result.user.uid).set({
                        'name':name.text,
                        'email':result.user.email,
                      });

                     // var userInfo2 = FirebaseFirestore.instance.collection('users').doc('kCLgY42WnUEiLt2PDF5Q').snapshots().listen((snapshots) {});
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => res_signup()),
                      );
                    }else{
                      print('please try later');
                    }
                  }
    }),




              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );

  }

    }




