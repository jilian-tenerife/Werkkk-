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
    Color baseColor = const Color(0xffdadada);

    return Center(
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
                'Werk',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5d7599)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 8,
                  intensity: 0.7,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey[300],
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
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 5,
                  shape: NeumorphicShape.convex,
                  lightSource: LightSource.topLeft,
                  intensity: 0.7,
                  color: baseColor,
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumorphicButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LeftPage()),
                  // );
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: const NeumorphicBoxShape.circle(),
                  depth: 8,
                  intensity: 0.7,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey[300],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  height: MediaQuery.of(context).size.width * 0.16,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.auto_graph_sharp,
                    color: Color(0xff5d7599),
                  ),
                ),
              ),
              NeumorphicButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatAiu()),
                  // );
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 8,
                  intensity: 0.7,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey[300],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.26,
                  height: MediaQuery.of(context).size.width * 0.26,
                  alignment: Alignment.center,
                  child: Text('AiU',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5d7599))),
                ),
              ),
              NeumorphicButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => howaiu_settings.Settings()),
                  // );
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 8,
                  intensity: 0.7,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey[300],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  height: MediaQuery.of(context).size.width * 0.16,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.settings,
                    color: Color(0xff5d7599),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
