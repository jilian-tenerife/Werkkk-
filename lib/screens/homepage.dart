import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DocumentSnapshot> freelanceWorkDocs = [];
  List<DocumentSnapshot> jobDocs = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Retrieve documents from Firebase collections
    QuerySnapshot freelanceWorkSnapshot =
        await FirebaseFirestore.instance.collection('freelance_work').get();
    QuerySnapshot jobSnapshot =
        await FirebaseFirestore.instance.collection('job').get();

    setState(() {
      freelanceWorkDocs = freelanceWorkSnapshot.docs;
      jobDocs = jobSnapshot.docs;
    });
  }

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
                  Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/LOGO.png'),
                        fit: BoxFit
                            .cover, // Specify how the image should be fitted inside the box
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
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
                        color: Color(0xff046865),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Dismissible card
              currentIndex <
                      (freelanceWorkDocs.length - 2) + (jobDocs.length - 1)
                  ? Dismissible(
                      key: Key(freelanceWorkDocs[currentIndex].id),
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
                        setState(() {
                          currentIndex++;
                        });
                      },
                      direction: DismissDirection.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            depth: 7,
                            shape: NeumorphicShape.convex,
                            lightSource: LightSource.topLeft,
                            intensity: 0.8,
                            color: Color(0xffFCFFF7),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                Text(
                                  freelanceWorkDocs[currentIndex]['title'],
                                  style: TextStyle(
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/lead.png'),
                                      fit: BoxFit
                                          .cover, // Specify how the image should be fitted inside the box
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Text(
                                  freelanceWorkDocs[currentIndex]
                                      ['description'],
                                  style: TextStyle(
                                    color: Color(
                                      0xff046865,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  freelanceWorkDocs[currentIndex]['area'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  freelanceWorkDocs[currentIndex]['pay'],
                                  style: TextStyle(
                                    color: Color(
                                      0xff046865,
                                    ),
                                  ),
                                ),
                                Text(
                                  jobDocs[currentIndex]['job_title'],
                                  style: TextStyle(
                                      color: Color(
                                    0xff046865,
                                  )),
                                ),
                                Text(
                                  jobDocs[currentIndex]['job_specialization'],
                                  style: TextStyle(
                                      color: Color(
                                    0xff046865,
                                  )),
                                ),
                                Text(
                                  jobDocs[currentIndex]['job_category'],
                                  style: TextStyle(
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  jobDocs[currentIndex]['company'],
                                  style: TextStyle(
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  jobDocs[currentIndex]['address'],
                                  style: TextStyle(
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  jobDocs[currentIndex]['salary'],
                                  style: TextStyle(
                                      color: Color(
                                        0xff046865,
                                      ),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  jobDocs[currentIndex]['description'],
                                  style: TextStyle(
                                      color: Color(
                                    0xff046865,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text('Chat')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              NeumorphicButton(
                onPressed: () {},
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 8,
                  intensity: 0.7,
                  lightSource: LightSource.topLeft,
                  color: baseColor,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  height: MediaQuery.of(context).size.width * 0.16,
                  alignment: Alignment.center,
                  child: Text(
                    "Chat",
                    style: TextStyle(
                        color: Color(
                      0xff046865,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
