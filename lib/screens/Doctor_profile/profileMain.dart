import 'package:flutter/material.dart';
import 'package:smartapp/screens/Doctor_profile/profile_body.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});
  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: buildappbar(screenSize: screenSize),
      body: DoctorProfileBody(),
    );
  }
}
