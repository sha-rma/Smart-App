import 'package:flutter/material.dart';

AppBar buildappbar({required pname, required screenSize}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height / 4.545,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.account_circle_rounded,
          size: screenSize.height / 10,
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: pname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
