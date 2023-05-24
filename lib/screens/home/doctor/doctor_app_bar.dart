import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../PatientList/patientlistMain.dart';

AppBar buildappbar({required screenSize, required context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height / 5.7,
    title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<DocumentSnapshot>(
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
                        text: "Welcome,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nDr. ' + pname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22),
                          ),
                        ]),
                  ),
                );
              })
        ]),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: screenSize.width * 0.07),
        child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PatientListMain()));
            },
            icon: Icon(
              Icons.person_add_alt_rounded,
              size: 30,
            )),
      )
    ],
  );
}
