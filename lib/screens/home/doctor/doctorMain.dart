import 'package:flutter/material.dart';
import 'package:smartapp/screens/home/doctor/doctor_app_bar.dart';
import 'doctor_body.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(screenSize: screenSize, context: context),
      body: DoctorBody(),
    );
  }
}
