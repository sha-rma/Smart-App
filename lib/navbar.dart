import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/student.dart';
import 'package:smartapp/profile.dart';
import 'package:smartapp/chat.dart';

class Navig extends StatefulWidget {
  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;
  List<Widget> _page = [
    Student(),
    Chat(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var ht = MediaQuery.of(context).size.height;
    return Scaffold(
        body: _page[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Color(0xFF07919D).withOpacity(0.3),
          selectedItemColor: Color(0xFF07919D),
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                //color: Color(0xFF07919D),
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                //color: Color(0xFF07919D),
                size: 30,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                //color: Color(0xFF07919D),
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ));
  }
}

// bottomNavigationBar: BottomNavigationBar(
      //   
      //   
      // )