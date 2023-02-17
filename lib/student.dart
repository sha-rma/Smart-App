import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:intl/intl.dart';
import 'package:smartapp/questionnairePage.dart';

import 'login.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF07919D),
        toolbarHeight: screenSize.height / 3.7,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: "Hello,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nPatiet Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: List.generate(
                  lastDayOfMonth.day,
                  (index) {
                    final currentDate =
                        lastDayOfMonth.add(Duration(days: index + 1));
                    final dayName = DateFormat('EE').format(currentDate);
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 40.0 : 2.0,
                        right: 0.0,
                        top: 20,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedIndex = index;
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42.0,
                              width: 42.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Color(0xFF07919D)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(44.0),
                              ),
                              child: Text(
                                dayName.substring(0, 2).toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black54,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            // Text(
                            //   "${index + 1}",
                            //   style: const TextStyle(
                            //     fontSize: 16.0,
                            //     color: Colors.black54,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: selectedIndex == index
                                    ? Colors.white
                                    : Color(0xFF07919D),
                                //backgroundColor: Color(0xFF07919D),
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              height: 4.0,
                              width: 4.0,
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 115),
            child: IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(
                Icons.account_circle_rounded,
                //color: Color(0xFF07919D),
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              // child: InkWell(
              //     //customBorder: CircleBorder(),
              //     //borderRadius: BorderRadius.circular(25.0),
              //     customBorder: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16)),
              //     splashColor: Color(0xFF07919D),
              //     onTap: () {},
              //     child: Ink.image(
              //         image: NetworkImage('https://i.imgur.com/YQ5Ixni.jpeg'),
              //         height: screenSize.height / 4,
              //         width: screenSize.width / 1.2,
              //         fit: BoxFit.fill,
              //         child: Text(
              //           'sdvsdv',
              //         ))),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  // child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(15),
                  //     child: Image.network('https://i.imgur.com/YQ5Ixni.jpeg',
                  //         fit: BoxFit.fill,
                  //         width: screenSize.width / 1.2,
                  //         height: screenSize.height / 49)
                  //         ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Questionnaire()));
                    },
                    // child: Image.network('https://i.imgur.com/YQ5Ixni.jpeg',
                    //     fit: BoxFit.cover,
                    //     height: screenSize.height / 4,
                    //     width: screenSize.width / 1.2)),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          fit: StackFit.loose,
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      'https://i.imgur.com/YQ5Ixni.jpeg',
                                      fit: BoxFit.fill,
                                      color: Colors.white.withOpacity(0.7),
                                      colorBlendMode: BlendMode.modulate,
                                      width: screenSize.width / 1.2,
                                      height: screenSize.height / 4)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 145),
                              child: Text("Daily Questionnaire",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 95,
                              ),
                              child: Text(
                                  "Click on \"Start\" to complete today's \n questionnaire",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22),
                              child: MaterialButton(
                                minWidth: screenSize.width / 1.5,
                                height: screenSize.height / 14,
                                color: Color(0xFF07919D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Questionnaire()));
                                },
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      'https://i.imgur.com/TdEEtZy.jpg',
                                      fit: BoxFit.fill,
                                      width: screenSize.width / 1.2,
                                      height: screenSize.height / 8)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 35, right: 205),
                                child: Text("History",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ), //Center(
      // child: TextButton(
      //   //color: Colors.teal,
      //   //textColor: Colors.white,
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => AndroidLargeTwoScreen()));
      //   },
      //   child: Text('Questionnaire'),
      // ),
      //),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
