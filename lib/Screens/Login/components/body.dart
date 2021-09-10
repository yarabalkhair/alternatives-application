import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/Login/components/background.dart';
import 'package:flutter_complete_guide/Screens/Signup/signup_screen.dart';
import 'package:flutter_complete_guide/components/already_have_an_account_acheck.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';
import 'package:flutter_complete_guide/components/rounded_input_field.dart';
import 'package:flutter_complete_guide/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/mainfood.dart';

//import 'package:flutter_complete_guide/Screens/bmicl/main.dart';


final _formkey = GlobalKey<FormState>();

TextEditingController _emailcontroller = TextEditingController();

TextEditingController _passwordcontroller = TextEditingController();



class Body extends StatelessWidget {
  const Body({

    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formkey,

       //   children: <Widget>[
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/logo.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
             // hintText: "Your Email",
              validator: (value) {
                if(value.isEmpty){
                return 'Please Fill Email Input';
              }
              },

            ),
            TextFormField(

              controller: _passwordcontroller,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if(value.isEmpty){
                return 'Please Fill Password Input';
              }},
            ),
            RoundedButton(

              text: "LOGIN",
              press : () async {
                ///exception 1
                try {
                  if (_formkey.currentState.validate()) {
                    var result = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text);

                    if (result != null) {
                      // pushReplacement

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    } else {
                      print('user not found');
                    }
                  }
                } catch(e){
                  print("this email doesn't exist, please try another email or try joining the application from the signup page");
                  print(e.toString());
                  throw 'login error ';
                }
              },
            ),




            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
