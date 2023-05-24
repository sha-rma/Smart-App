import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AppBar buildappbar({required screenSize}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height / 4.545,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.account_circle_rounded,
          size: screenSize.height / 10,
        ),
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
              return RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: pname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              );
            }),
      ],
    ),
  );
}
