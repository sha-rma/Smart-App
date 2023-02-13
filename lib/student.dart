import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF07919D),
          toolbarHeight: screenSize.height / 3.5,
          title: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: "Hello,",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nPatient Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
          actions: [
            IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        body: Center(
            // child: TextButton(
            //   //color: Colors.teal,
            //   //textColor: Colors.white,
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => AndroidLargeTwoScreen()));
            //   },
            //   child: Text('Questionnaire'),
            // ),
            ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xFF07919D),
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                color: Color(0xFF07919D),
                size: 30,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF07919D),
                size: 30,
              ),
              label: 'School',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Color(0xFF07919D).withOpacity(0.3),
          elevation: 0,
        ));
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
