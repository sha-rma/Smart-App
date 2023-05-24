import 'package:flutter/material.dart';
import '../../backend/auth.dart';
import '../../constansts/constant.dart';

class DoctorProfileBody extends StatefulWidget {
  const DoctorProfileBody({Key? key}) : super(key: key);

  @override
  State<DoctorProfileBody> createState() => _DoctorProfileBodyState();
}

class _DoctorProfileBodyState extends State<DoctorProfileBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: screenSize.height,
            color: Color(0xFF07919D),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.22),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white,
              ),
              height: screenSize.height * 0.78,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.128),
            child: Center(
                child: Container(
              height: screenSize.width * 0.4,
              width: screenSize.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenSize.width * 0.4),
                  image: DecorationImage(
                      image: AssetImage('assets/user.png'), fit: BoxFit.fill)),
            )),
          ),
          reusableContainer(
              screenSize.height, screenSize.width, 1, "displayName"),
          reusableContainer(screenSize.height, screenSize.width, 1.3, "age"),
          reusableContainer(screenSize.height, screenSize.width, 1.6, "gender"),
          reusableContainer(screenSize.height, screenSize.width, 1.9, "email"),
          reusableContainer(screenSize.height, screenSize.width, 2.2, "phone"),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.93, left: screenSize.width * 0.22),
            child: MaterialButton(
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
          ),
        ],
      ),
    );
  }
}
