// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/utils/io.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Questionnaire extends StatefulWidget {
  var details;
  Questionnaire({required this.details});

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  late SVC svc;

  int _questionSlider = 0;
  double _sliderValue = 0;
  final FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  List<String> _questionHeadings = [
    'Question 1',
    'Question 2',
    'Question 3',
    'Question 4',
    'Question 5',
    'Question 6',
    'Question 7',
    'Question 8',
    'Question 9',
    'Question 10',
    'Question 11',
    'Question 12',
  ];
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

  List<Map<String, dynamic>> _emojiValues = [
    {'emoji': '😊', 'value': 1.0},
    {'emoji': '😐', 'value': 2.0},
    {'emoji': '🙁', 'value': 3.0},
    {'emoji': '😢', 'value': 4.0},
  ];

  List<double> answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> input = [0, 0, 0, 0, 0, 0, 0, 0];

  bool Severe = false;

  void tranform() {
    input[0] = (answers[0] + answers[1] + answers[2]) / 3;
    input[1] = (answers[3] + answers[4]) / 2;
    input[2] = (answers[5] + answers[6]) / 2;
    input[3] = answers[7];
    input[4] = answers[8];
    input[5] = answers[9];
    input[6] = answers[10];
    input[7] = answers[11];
    for (int i = 0; i < 8; ++i) {
      //print(input[i]);
      input[i] = ((input[i] - 1) / 3) * 100;
      print(i);
      //print("abc\n");
      //print(input[i]);
    }
    loadModel("assets/model.json").then((x) {
      svc = SVC.fromMap(json.decode(x));
    });
    int a = svc.predict(input);
    print(a);
    if (a == 0) {
      Severe = true;
    } else {
      Severe = false;
    }
    User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    print(uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'isSevere': Severe});
    // var userDoc=FirebaseFirestore.instance
    // .collection('users')
    // .doc(uid).collection();
  }

  void showPopup(BuildContext context, bool isSevere) {
    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          // Use a different theme depending on the value of isSevere
          data: isSevere
              ? ThemeData(
                  primaryColor: Colors.red,
                  brightness: Brightness.dark,
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.redAccent),
                )
              : ThemeData(
                  primaryColor: Colors.green,
                  brightness: Brightness.light,
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.greenAccent),
                ),
          child: AlertDialog(
            title: Text(isSevere
                ? 'You symptoms indicate that you may need to go to the hospital.'
                : 'Your symptoms are common to the treatment. Please continue doing the questionnair daily'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07919D),
        title: Text("Questionnaire"),
        toolbarHeight: screenSize.height * 0.15,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  _questionHeadings[_questionSlider],
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenSize.width * 0.07,
                    top: screenSize.height * 0.02),
                child: SizedBox(
                  height: screenSize.height * 0.08,
                  width: screenSize.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      speak(_questions[_questionSlider]);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenSize.height * 0.08))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF07919D))),
                    child: Icon(Icons.volume_up),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              _questions[_questionSlider],
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _emojiValues.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      answers[_questionSlider] = item["value"];
                      _sliderValue = item["value"] - 1;
                      //print(answers[_questionSlider]);
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        item['emoji'],
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Slider(
              activeColor: const Color(0xFF07919D),
              secondaryActiveColor: Color.fromARGB(255, 15, 231, 251),
              value: _sliderValue.toDouble(),
              min: 0,
              max: 3,
              divisions: 3,
              onChanged: (double value) {
                setState(() {
                  answers[_questionSlider] = value + 1.0;
                  _sliderValue = value;
                  //print(answers[_questionSlider]);
                });
              },
            ),
          ),
          Expanded(child: Container()),
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Row(
          //     children: [
          //       Text('😞'),
          // Expanded(
          //   child: Slider(
          //     value: _sliderValue.toDouble(),
          //     min: 0,
          //     max: 4,
          //     divisions: 4,
          //     onChanged: (double value) {
          //       setState(() {
          //         _sliderValue = value.round();
          //       });
          //     },
          //   ),
          // ),
          //       Text('😀'),
          //     ],
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // MaterialButton(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(15.0))),
              //   elevation: 5.0,
              //   height: 50,
              //   minWidth: 300,
              //   onPressed: () {
              //     setState(() {
              //       if (_questionSlider > 0) {
              //         setState(() {
              //           _questionSlider--;
              //         });
              //       }
              //     });
              //   },
              //   child: Text(
              //     "Previous",
              //     style: TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w800,
              //         color: Colors.white),
              //   ),
              //   color: Color(0xFF07919D),
              // ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: _questionSlider == 0
                      ? ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        )
                      : ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF07919D),
                          ),
                        ),
                  child: Text('Previous'),
                  onPressed: () {
                    if (_questionSlider > 0) {
                      setState(() {
                        _questionSlider--;
                        _sliderValue = 0;
                      });
                    }
                  },
                ),
              ),
              _questionSlider == 11
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        child: Text('Submit'),
                        onPressed: () {
                          setState(() {
                            tranform();
                            widget.details["isSevere"] = Severe;
                            // showPopup(context, Severe);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF07919D),
                          ),
                        ),
                        child: Text('Next'),
                        onPressed: () {
                          if (_questionSlider < 11) {
                            setState(() {
                              _questionSlider++;
                              _sliderValue = 0;
                            });
                          }
                        },
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
