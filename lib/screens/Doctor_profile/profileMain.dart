import 'package:flutter/material.dart';
import 'package:smartapp/screens/Doctor_profile/profile_body.dart';
import '../Patient_profile/profile_app_bar.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});
  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(pname: "Doctor Name", screenSize: screenSize),
      body: DoctorProfileBody(),
    );
  }
}
