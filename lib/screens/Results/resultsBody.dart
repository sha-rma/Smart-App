import 'package:flutter/material.dart';
import 'package:smartapp/screens/chat/chatInbox.dart';
import '../../constansts/constant.dart';
// import '../chat/chat.dart';

// ignore: must_be_immutable
class ResultsBody extends StatefulWidget {
  var details;
  List<dynamic> answers;
  ResultsBody({this.details, required this.answers});

  @override
  State<ResultsBody> createState() => _ResultsBodyState();
}

class _ResultsBodyState extends State<ResultsBody> {
  List<String> _questions = [
    'On a scale of 1 to 4, did you need to rest?',
    'On a scale of 1 to 4, have you felt weak?',
    'On a scale of 1 to 4, were you tired?',
    'On a scale of 1 to 4, have you felt nauseated?',
    'On a scale of 1 to 4, have you vomited?',
    'On a scale of 1 to 4, have you had pain?',
    'On a scale of 1 to 4, did pain interfere with your daily activities?',
    'On a scale of 1 to 4, were you short of breath?',
    'On a scale of 1 to 4, have you had trouble sleeping?',
    'On a scale of 1 to 4, have you lacked appetite?',
    'On a scale of 1 to 4, have you been constipated? ',
    'On a scale of 1 to 4, have you had diarrhea?',
  ];

  Map questionnairReport = {};

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 12; i++) {
      questionnairReport[_questions[i]] = widget.answers[i];
    }

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
                        if (widget.details != null)
                          LaunchUrl(widget.details['phone']);
                        else
                          LaunchUrl("9061742261");
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
                    Container(
                      width: 250,
                      height: 400,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: questionnairReport.entries.map((entry) {
// This is the question number
                            int index = questionnairReport.keys
                                    .toList()
                                    .indexOf(entry.key) +
                                1;
// This is the question
                            String question = entry.key;
// This is the answer
                            double answer = entry.value;
// This is the widget that displays the question and answer
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Question $index: $question',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Answer: $answer',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatInboxScreen()));
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
