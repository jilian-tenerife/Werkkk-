import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:freelancy/screens/freelancer.dart';

class welcomingPage extends StatefulWidget {
  const welcomingPage({super.key});

  @override
  State<welcomingPage> createState() => _welcomingPageState();
}

class _welcomingPageState extends State<welcomingPage> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff046865)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text(
                  'Are you hiring?',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff046865)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.4, // 70% of screen width
                  height: MediaQuery.of(context).size.height *
                      0.06, // 8% of screen height
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
                                builder: (context) => userProfile()));
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
                          'Start Hiring', // Set the text of the button
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                  0xff046865)), // Set the font size of the text
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Are you looking for job?",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff046865)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.4, // 70% of screen width
                  height: MediaQuery.of(context).size.height *
                      0.06, // 8% of screen height
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
                                builder: (context) => userProfile()));
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
                          'Search for jobs', // Set the text of the button
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                  0xff046865)), // Set the font size of the text
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
