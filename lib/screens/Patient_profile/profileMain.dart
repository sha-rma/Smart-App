import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/screens/Patient_profile/profile_body.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

String? GetName() {
  var pName;
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    pName = documentSnapshot.get('displayName').toString();
  });
  return pName;
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: buildappbar(screenSize: screenSize),
      body: PatientProfileBody(),
    );
  }
}
