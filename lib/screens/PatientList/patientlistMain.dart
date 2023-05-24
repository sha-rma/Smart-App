import 'package:flutter/material.dart';
import 'package:smartapp/screens/PatientList/patientlistBody.dart';

class PatientListMain extends StatefulWidget {
  const PatientListMain({Key? key}) : super(key: key);

  @override
  State<PatientListMain> createState() => _PatientListMainState();
}

class _PatientListMainState extends State<PatientListMain> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: buildappbar(screenSize: screenSize),
      body: PatientListBody(),
    );
  }
}
