import 'package:flutter/material.dart';
import 'package:smartapp/screens/History/historyAppbar.dart';
import 'package:smartapp/screens/History/historyBody.dart';

class HistoryMain extends StatefulWidget {
  const HistoryMain({Key? key}) : super(key: key);

  @override
  State<HistoryMain> createState() => _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(screenSize: screenSize),
      body: HistoryBody(),
    );
  }
}
