import 'package:flutter/material.dart';

AppBar buildappbar({required screenSize}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF07919D),
    toolbarHeight: screenSize.height / 4.545,
    elevation: 0,
  );
}
