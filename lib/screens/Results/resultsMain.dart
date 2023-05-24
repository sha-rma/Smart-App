import 'package:flutter/material.dart';
import 'package:smartapp/screens/Results/resultsBody.dart';

// ignore: must_be_immutable
class Results extends StatefulWidget {
  var details;
  Results({required this.details});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: buildappbar(screenSize: screenSize),
      body: ResultsBody(
        details: widget.details,
      ),
    );
  }
}
