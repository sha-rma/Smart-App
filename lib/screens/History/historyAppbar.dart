import 'package:flutter/material.dart';

AppBar buildappbar({required screenSize, required context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height * 0.2,
    title: Padding(
      padding: EdgeInsets.only(left: screenSize.width * 0.04),
      child: Text(
        'History',
        style: TextStyle(fontSize: 22),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(
            right: screenSize.width * 0.05, top: screenSize.height * 0.01),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_rounded,
              size: 30,
            )),
      )
    ],
  );
}
