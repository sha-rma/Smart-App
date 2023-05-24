import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PatientListBody extends StatefulWidget {
  const PatientListBody({Key? key}) : super(key: key);

  @override
  State<PatientListBody> createState() => _PatientListBodyState();
}

class _PatientListBodyState extends State<PatientListBody> {
  String name = "";
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          // Container(
          //   height: screenSize.height,
          //   width: screenSize.width,
          //   decoration: BoxDecoration(color: Colors.white),
          // ),
          Container(
            height: screenSize.height * 0.2,
            decoration: BoxDecoration(
              color: Color(0xFF07919D),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.06),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.555),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.16, left: screenSize.width * 0.0833),
            child: Container(
                height: screenSize.height * 0.08,
                width: screenSize.width * 0.833,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 2, color: Colors.black),
                  color: Color(0xFFF0F0F0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.073,
                      top: screenSize.width * 0.013),
                  child: TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      name = value;
                    },
                    onEditingComplete: () async {
                      //to fix
                      var x = FirebaseFirestore.instance
                          .collection('users')
                          .where('email', isEqualTo: name)
                          .where('role', isEqualTo: 'Patient');

                      // ignore: unnecessary_null_comparison
                      if (x != null) {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({
                          'pList': FieldValue.arrayUnion([name])
                        }, SetOptions(merge: true));
                      } else {
                        print("no usr");
                      }
                      emailController.text = "";
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 18)),
                  ),
                )),
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: ((context, snapshot) {
                List plist = [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  plist = [];
                } else {
                  Map<String, dynamic> nam =
                      snapshot.data!.data() as Map<String, dynamic>;
                  if (nam['pList'] != null) {
                    plist = nam['pList'];
                  }
                }
                return Container(
                  padding: EdgeInsets.only(top: screenSize.height * 0.2),
                  height: screenSize.height,
                  child: ListView.builder(
                      itemCount: plist.length,
                      itemBuilder: (cntxt, i) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(0.5)))),
                          height: screenSize.height * 0.1,
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.07),
                              child: Text(
                                plist[i],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: screenSize.width * 0.05),
                              child: IconButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .set({
                                      'pList':
                                          FieldValue.arrayRemove([plist[i]])
                                    }, SetOptions(merge: true));
                                  },
                                  icon: Icon(Icons.delete)),
                            )
                          ]),
                        );
                      }),
                );
              }))
        ],
      ),
    );
  }
}
