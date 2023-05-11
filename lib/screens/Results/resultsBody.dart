import 'package:flutter/material.dart';

class ResultsBody extends StatefulWidget {
  const ResultsBody({Key? key}) : super(key: key);

  @override
  State<ResultsBody> createState() => _ResultsBodyState();
}

class _ResultsBodyState extends State<ResultsBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Text("Work In Progress"),
              )
            ],
          ),
        )
      ],
    ))));
  }
}
