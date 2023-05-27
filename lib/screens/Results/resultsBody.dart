import 'package:flutter/material.dart';
import 'package:smartapp/screens/chat/chatInbox.dart';
import '../../constansts/constant.dart';
// import '../chat/chat.dart';

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
                        LaunchUrl(widget.details['phone']);
                      },
                      icon: Icon(
                        Icons.phone_rounded,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChatInboxScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: screenSize.height * 0.05),
                        child: Container(
                            height: screenSize.height * 0.06,
                            width: screenSize.width * 0.455,
                            decoration: BoxDecoration(
                                color: Color(0xFF07919D),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Message  ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Icon(
                                  Icons.chat_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
