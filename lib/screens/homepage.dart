import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xffFCFFF7);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(
                    'WERK',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff046865)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.23,
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 8,
                      intensity: 0.8,
                      lightSource: LightSource.topLeft,
                      color: Color(0xffFCFFF7),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.width * 0.13,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.person_2,
                        color: Color(0xff5d7599),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Dismissible(
                key: Key("uniqueKey"),
                background: Container(
                  color: Color(0xff21A0A0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Color(0xffE53D00),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    print("Rejected");
                  } else if (direction == DismissDirection.startToEnd) {
                    print("Accepted");
                  }
                },
                direction: DismissDirection.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: 7,
                      shape: NeumorphicShape.convex,
                      lightSource: LightSource.topLeft,
                      intensity: 0.8,
                      color: Color(0xffFCFFF7),
                    ),
                    child: Center(
                      child: Text("Swipe me",
                          style: TextStyle(color: Colors.amber)),
                    ),
                  ),
                ),
              ),

              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   child: Neumorphic(
              //     style: NeumorphicStyle(
              //       depth: 5,
              //       shape: NeumorphicShape.convex,
              //       lightSource: LightSource.topLeft,
              //       intensity: 0.7,
              //       color: Color(0xffc3acce),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
