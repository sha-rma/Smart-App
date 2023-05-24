import 'package:flutter/material.dart';

import '../chat/chat.dart';

// ignore: must_be_immutable
class ResultsBody extends StatefulWidget {
  var details;
  ResultsBody({required this.details});

  @override
  State<ResultsBody> createState() => _ResultsBodyState();
}

class _ResultsBodyState extends State<ResultsBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: screenSize.height * 0.266,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Color(0xFF07919D),
            ),
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(screenSize.width * 0.08, 0, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(screenSize.width * 0.55, 0, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chat()));
                      },
                      icon: Icon(
                        Icons.chat_rounded,
                        size: 25,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.213),
            child: Container(
              height: screenSize.height * 0.786,
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.266),
              child: Container(
                height: screenSize.height * 0.68,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        width: 2, color: Colors.black.withOpacity(0.5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Work In Progress")],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
