import 'package:flutter/material.dart';
import 'package:smartapp/screens/Results/resultsBody.dart';
import 'resultsAppBar.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(screenSize: screenSize),
      body: ResultsBody(),
    );
  }
}
