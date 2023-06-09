import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:freelancy/screens/welcoming.dart';

import 'forgotPass.dart';
import 'homepage.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.05, // 10% of screen height
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/LOGO.png'),
                        fit: BoxFit
                            .cover, // Specify how the image should be fitted inside the box
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  height: MediaQuery.of(context).size.height *
                      0.08, // 8% of screen height
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: -3,
                        shape: NeumorphicShape.concave,
                        color: baseColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffabb6c8)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Color(0xff046865),
                          ),
                          filled: true,
                          fillColor: baseColor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  height: MediaQuery.of(context).size.height *
                      0.08, // 8% of screen height
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: -3,
                        shape: NeumorphicShape.flat,
                        color: baseColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.025),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5d7599)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xff046865),
                          ),
                          filled: true,
                          fillColor: baseColor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff046865),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff5d7599)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotPassword()));
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.7, // 70% of screen width
                height: MediaQuery.of(context).size.height *
                    0.07, // 8% of screen height
                // other code

                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: 5,
                      shape: NeumorphicShape.convex,
                      lightSource: LightSource.topLeft,
                      intensity: 0.7,
                      color: baseColor),
                  child: NeumorphicButton(
                    onPressed: () async {
                      try {
                        final UserCredential userCredential =
                            await _auth.signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text);
                        if (userCredential.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => welcomingPage()),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        String message;
                        if (e.code == 'user-not-found') {
                          message = ('No user found with that email.');
                        } else if (e.code == 'wrong-password') {
                          message = ('Wrong password provided for that user.');
                        } else {
                          message = "Something went wrong.";
                        }
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                padding: EdgeInsets.all(20),
                                color: Colors.transparent,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 3,
                                    lightSource: LightSource.topLeft,
                                    color: baseColor,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Text(
                                        "Error",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff046865)),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Text(
                                        message,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff5d7599)),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025),
                                      NeumorphicButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          depth: 8,
                                          intensity: 0.7,
                                          lightSource: LightSource.bottomRight,
                                          color: Colors.grey[300],
                                        ),
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Color(0xff046865)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      depth: 8,
                      intensity: 0.7,
                      lightSource: LightSource.bottomRight,
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        'Log In', // Set the text of the button
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(
                                0xff046865)), // Set the font size of the text
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.047,
              ),
              InkWell(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color(0xff046865),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff5d7599)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
