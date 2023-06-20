import 'package:flutter/material.dart';
import 'package:smartapp/screens/chat/chatInbox.dart';
import 'package:smartapp/screens/home/patient/patientMain.dart';
import 'Doctor_profile/profileMain.dart';
import 'Patient_profile/profileMain.dart';
import 'home/doctor/doctorMain.dart';

// ignore: must_be_immutable
class Navig extends StatefulWidget {
  bool isdoctor;
  Navig({required this.isdoctor});
  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _page = [
      widget.isdoctor ? Teacher() : Student(),
      ChatInboxScreen(),
      widget.isdoctor ? DoctorProfile() : PatientProfile(),
    ];
    // var wid = MediaQuery.of(context).size.width;
    // var ht = MediaQuery.of(context).size.height;
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
