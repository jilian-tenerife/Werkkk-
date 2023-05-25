import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:freelancy/screens/homepage.dart';

class userProfile extends StatefulWidget {
  userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  final _lController = TextEditingController();
  final _fController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _cityController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xffFCFFF7);
    return SafeArea(
        child: Scaffold(
            backgroundColor: baseColor,
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.1, // 10% of screen height
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
                            controller: _lController,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffabb6c8)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Surname',
                              hintStyle: const TextStyle(
                                color: Color(0xff5d7599),
                              ),
                              filled: true,
                              fillColor: baseColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                            controller: _fController,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffabb6c8)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First name',
                              hintStyle: const TextStyle(
                                color: Color(0xff5d7599),
                              ),
                              filled: true,
                              fillColor: baseColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // 80% of screen width
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
                            controller: _countryController,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffabb6c8)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Country',
                              hintStyle: const TextStyle(
                                color: Color(0xff5d7599),
                              ),
                              filled: true,
                              fillColor: baseColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        width: MediaQuery.of(context).size.width *
                            0.5, // 80% of screen width
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
                              controller: _stateController,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffabb6c8)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Province',
                                hintStyle: const TextStyle(
                                  color: Color(0xff5d7599),
                                ),
                                filled: true,
                                fillColor: baseColor,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width *
                            0.3, // 80% of screen width
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
                              controller: _zipController,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffabb6c8)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Zip code',
                                hintStyle: const TextStyle(
                                  color: Color(0xff5d7599),
                                ),
                                filled: true,
                                fillColor: baseColor,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                              ),
                            ),
                          ),
                        )),
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // 80% of screen width
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
                            controller: _cityController,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffabb6c8)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'City',
                              hintStyle: const TextStyle(
                                color: Color(0xff5d7599),
                              ),
                              filled: true,
                              fillColor: baseColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
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
                                      0xff5d7599)), // Set the font size of the text
                            ),
                          ),
                        ),
                        // Set the font size of the text
                      ))
                ]))));
  }
}
