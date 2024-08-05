import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon/Screens/login_screen.dart';
import 'package:hackathon/utils/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  TextEditingController fullNameControl = TextEditingController();
  signupFunc() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // name: fullNameControl.text,
        email: emailControl.text,
        password: passwordControl.text,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
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
                  Text("Full Name"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: fullNameControl,
                      decoration: InputDecoration(
                        labelText: 'Reggie James',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
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
                            signupFunc();
                          },
                          child: Text(
                            'Create Account',
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
                      Text("Already have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Sign in",
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
