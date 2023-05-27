import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _questionSlider = 0;
  int _sliderValue = 0;
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
  ];
  List<String> _questions = [
    'On a scale of 0 to 5, how severe is your nausea?',
    'On a scale of 0 to 5, how severe is your vomiting?',
    'On a scale of 0 to 5, how severe is your fatigue?',
    'On a scale of 0 to 5, how severe is your pain?',
    'On a scale of 0 to 5, how severe is your loss of appetite?',
    'On a scale of 0 to 5, how severe is your difficulty sleeping?',
    'On a scale of 0 to 5, how severe is your anxiety or depression?',
    'On a scale of 0 to 5, how severe is your loss of hair loss or changes in hair texture?',
  ];

  List<Map<String, dynamic>> _emojiValues = [
    {'emoji': '😊', 'value': 1},
    {'emoji': '🙂', 'value': 2},
    {'emoji': '😐', 'value': 3},
    {'emoji': '🙁', 'value': 4},
    {'emoji': '😢', 'value': 5},
  ];
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
                      _sliderValue = item["value"] - 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        item['emoji'],
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        item['value'].toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Slider(
              activeColor:  const Color(0xFF07919D),
              secondaryActiveColor:  Color.fromARGB(255, 15, 231, 251),
              value: _sliderValue.toDouble(),
              min: 0,
              max: 4,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value.round();
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
              _questionSlider == 7
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
                            Navigator.pop(
                              context,
                            );
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
                          if (_questionSlider < 7) {
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
