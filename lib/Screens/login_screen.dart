import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon/Screens/home_screen.dart';
import 'package:hackathon/Screens/signup_screen.dart';
import 'package:hackathon/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  signinFunc(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControl.text, password: passwordControl.text);

      print(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    // print("Tes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(top: 80),
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("Assets/images/Logo.png"),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Email"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailControl,
                      decoration: InputDecoration(
                        labelText: 'reggiejames001@website.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text("Password "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordControl,
                      decoration: InputDecoration(
                        labelText: '*********',
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            signinFunc(context);
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: purple,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New Here"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            // ),
          ),
          Container(
              margin: EdgeInsets.only(top: 580),
              child: Center(
                  child: Text(
                "Copyright 2024",
                style: TextStyle(color: Colors.white),
              ))),
        ]),
      ),
    );
  }
}
