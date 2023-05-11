import 'package:flutter/material.dart';
import 'package:smartapp/screens/Patient_profile/profile_body.dart';
import '../Doctor_profile/profile_app_bar.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(pname: "Patient Name", screenSize: screenSize),
      body: PatientProfileBody(),
    );
  }
}
