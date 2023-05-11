import 'package:flutter/material.dart';
import 'package:smartapp/screens/Results/resultsMain.dart';

class DoctorBody extends StatefulWidget {
  const DoctorBody({Key? key}) : super(key: key);

  @override
  State<DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<DoctorBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.032,
              ),
              InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 85,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Patient 1",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Age : 45", style: TextStyle(fontSize: 15))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  width: screenSize.width * 0.83,
                  height: screenSize.height * 0.22,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Results()));
                },
              ),
              SizedBox(
                height: screenSize.height * 0.032,
              ),
            ],
          ),
        )
      ],
    ))));
  }
}
