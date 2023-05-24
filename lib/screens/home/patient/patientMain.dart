import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/screens/home/patient/patient_body.dart';
import '../../../backend/auth.dart';

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
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF07919D),
          toolbarHeight: screenSize.height / 6.5,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      String pname;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        pname = "";
                      } else {
                        Map<String, dynamic> nam =
                            snapshot.data!.data() as Map<String, dynamic>;
                        pname = nam['displayName'];
                      }
                      return Padding(
                        padding: EdgeInsets.only(left: screenSize.width * 0.05),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "Hello,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\n' + pname,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
              ),
              // const SizedBox(height: 5),

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   physics: const ClampingScrollPhysics(),
              //   child: Row(
              //     children: List.generate(
              //       lastDayOfMonth.day,
              //       (index) {
              //         final currentDate =
              //             lastDayOfMonth.add(Duration(days: index + 1));
              //         final dayName = DateFormat('EE').format(currentDate);
              //         return Padding(
              //           padding: EdgeInsets.only(
              //             left: index == 0 ? 40.0 : 0.0,
              //             right: 0.0,
              //             top: 20,
              //           ),
              //           child: GestureDetector(
              //             onTap: () => setState(() {
              //               selectedIndex = index;
              //             }),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Container(
              //                   height: 42.0,
              //                   width: 42.0,
              //                   alignment: Alignment.center,
              //                   decoration: BoxDecoration(
              //                     color: selectedIndex == index
              //                         ? Color(0xFF07919D)
              //                         : Colors.transparent,
              //                     borderRadius: BorderRadius.circular(44.0),
              //                   ),
              //                   child: Text(
              //                     dayName.substring(0, 2).toUpperCase(),
              //                     style: TextStyle(
              //                       fontSize: 18.0,
              //                       color: selectedIndex == index
              //                           ? Colors.white
              //                           : Colors.black54,
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8.0),
              //                 CircleAvatar(
              //                   radius: 17,
              //                   backgroundColor: Colors.white,
              //                   child: CircleAvatar(
              //                     radius: 16,
              //                     backgroundColor: selectedIndex == index
              //                         ? Colors.white
              //                         : Color(0xFF07919D),
              //                     child: Text(
              //                       "${index + 1}",
              //                       style: const TextStyle(
              //                         fontSize: 16.0,
              //                         color: Colors.black54,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8.0),
              //                 Container(
              //                   height: 4.0,
              //                   width: 4.0,
              //                   decoration: BoxDecoration(
              //                       color: selectedIndex == index
              //                           ? Colors.white
              //                           : Colors.transparent,
              //                       shape: BoxShape.circle),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: screenSize.width * 0.05,
              ),
              child: IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout_rounded,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: PatientBody());
  }
}
