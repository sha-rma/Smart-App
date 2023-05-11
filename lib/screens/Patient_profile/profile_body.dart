import 'package:flutter/material.dart';
import '../../backend/auth.dart';

class PatientProfileBody extends StatefulWidget {
  const PatientProfileBody({Key? key}) : super(key: key);

  @override
  State<PatientProfileBody> createState() => _PatientProfileBodyState();
}

class _PatientProfileBodyState extends State<PatientProfileBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF07919D),
              // color: Colors.red
            ),
            height: screenSize.height / 9,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: screenSize.height / 1.27,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  elevation: 5.0,
                  height: screenSize.height / 16.67,
                  minWidth: screenSize.width / 1.8,
                  onPressed: () {
                    logout(context);
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  color: Color(0xFF07919D),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
