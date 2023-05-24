import 'package:flutter/material.dart';

AppBar buildappbar({required screenSize}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height / 5.7,
    title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.05),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: "Details,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nPatient 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          )
        ]),
  );
}
