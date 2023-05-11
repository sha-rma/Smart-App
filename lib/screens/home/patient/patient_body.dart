import 'package:flutter/material.dart';
import '../../questionnare/questionnairePage.dart';

class PatientBody extends StatefulWidget {
  const PatientBody({Key? key}) : super(key: key);

  @override
  State<PatientBody> createState() => _PatientBodyState();
}

class _PatientBodyState extends State<PatientBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Questionnaire()));
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        fit: StackFit.loose,
                        children: [
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                    'https://i.imgur.com/YQ5Ixni.jpeg',
                                    fit: BoxFit.fill,
                                    color: Colors.white.withOpacity(0.7),
                                    colorBlendMode: BlendMode.modulate,
                                    width: screenSize.width / 1.2,
                                    height: screenSize.height / 4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 145),
                            child: Text("Daily Questionnaire",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 95,
                            ),
                            child: Text(
                                "Click on \"Start\" to complete today's \n questionnaire",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: MaterialButton(
                              minWidth: screenSize.width / 1.5,
                              height: screenSize.height / 14,
                              color: Color(0xFF07919D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Questionnaire()));
                              },
                              child: Text(
                                "Start",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          fit: StackFit.loose,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                    'https://i.imgur.com/TdEEtZy.jpg',
                                    fit: BoxFit.fill,
                                    width: screenSize.width / 1.2,
                                    height: screenSize.height / 8)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 30, right: 170),
                              child: Text("History",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
