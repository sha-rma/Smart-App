// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, body_might_complete_normally_catch_error

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
// import 'model.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController displayName = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController age = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController gender = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Patient',
    'Doctor',
  ];
  var _currentItemSelected = "Patient";
  var role = "Patient";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.05),
                child: Container(
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenSize.width * 0.05,
                                top: screenSize.height * 0.026),
                            child: Text(
                              "Sign Up,",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF07919D),
                                fontSize: 32,
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.006),
                          Padding(
                            padding:
                                EdgeInsets.only(left: screenSize.width * 0.055),
                            child: Text(
                              "Enter your details below",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              controller: displayName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.01),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Name cannot be empty";
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              controller: age,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Age',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.01),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Age cannot be empty";
                                }
                              },
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              controller: gender,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Gender (Male/Female)',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.01),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Gender cannot be empty";
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.01),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Email cannot be empty";
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please enter a valid email");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.01),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Phone Number cannot be empty";
                                }
                              },
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.black.withOpacity(0.1),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.02),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("please enter valid password min. 6 character");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenSize.width * 0.027,
                                0,
                                screenSize.width * 0.027,
                                0),
                            child: TextFormField(
                              obscureText: _isObscure2,
                              controller: confirmpassController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.black.withOpacity(0.1),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure2 = !_isObscure2;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.2)),
                                enabled: true,
                                contentPadding: EdgeInsets.only(
                                    left: screenSize.width * 0.038,
                                    bottom: screenSize.height * 0.01,
                                    top: screenSize.height * 0.02),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Colors.black),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (confirmpassController.text !=
                                    passwordController.text) {
                                  return "Password did not match";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.026,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Type of account: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              DropdownButton<String>(
                                dropdownColor: Colors.white,
                                underline: Container(),
                                borderRadius: BorderRadius.circular(15),
                                isDense: false,
                                isExpanded: false,
                                iconEnabledColor: Colors.black,
                                focusColor: Colors.black,
                                items: options.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValueSelected) {
                                  setState(() {
                                    _currentItemSelected = newValueSelected!;
                                    role = newValueSelected;
                                  });
                                },
                                value: _currentItemSelected,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                elevation: 5.0,
                                height: 50,
                                minWidth: 300,
                                onPressed: () {
                                  setState(() {
                                    showProgress = true;
                                  });
                                  signUp(
                                      emailController.text,
                                      passwordController.text,
                                      role,
                                      displayName.text,
                                      age.text,
                                      phone.text,
                                      gender.text);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                                color: Color(0xFF07919D),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.053,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new MaterialButton(
                                shape: CircleBorder(),
                                elevation: 3,
                                height: 50,
                                minWidth: 50,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_rounded,
                                      size: 35,
                                      color: Color(0xFF07919D),
                                    ),
                                  ],
                                ),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password, String role, String displayName,
      String age, String phone, String gender) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(
                    email, role, displayName, age, phone, gender)
              })
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String role, String displayName,
      String age, String phone, String gender) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'role': role,
      'displayName': displayName,
      'age': age,
      'phone': phone,
      'gender': gender
    });
    if (role == "Doctor") {
      ref.doc(user.uid).set({'pList': []}, SetOptions(merge: true));
      ref.doc(user.uid).set({'dList': []}, SetOptions(merge: true));
      ref.doc(user.uid).set({'sList': []}, SetOptions(merge: true));
    } else {
      ref.doc(user.uid).set({'isSevere': false}, SetOptions(merge: true));
      ref.doc(user.uid).set({'pList': []}, SetOptions(merge: true));
      ref.doc(user.uid).set({'dList': []}, SetOptions(merge: true));
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
