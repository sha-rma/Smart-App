import 'package:flutter/material.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Text("Work In Progress"),
          ),
        ),
      )
    ]));
  }
}
