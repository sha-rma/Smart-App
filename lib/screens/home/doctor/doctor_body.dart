import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/constansts/constant.dart';

class DoctorBody extends StatefulWidget {
  const DoctorBody({Key? key}) : super(key: key);

  @override
  State<DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<DoctorBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: ((context, snapshot) {
                  List plist = [], slist = [];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    plist = [];
                    slist = [];
                  } else {
                    Map<String, dynamic> nam =
                        snapshot.data!.data() as Map<String, dynamic>;
                    if (nam['pList'] != null) {
                      plist = nam['pList'];
                    }
                    if (nam['sList'] != null) {
                      slist = nam['sList'];
                    }
                  }
                  return Container(
                    padding: EdgeInsets.only(top: screenSize.height * 0.02),
                    height: screenSize.height,
                    child: ListView.builder(
                        itemCount: plist.length,
                        itemBuilder: (cntxt, i) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .where('email', isEqualTo: plist[i])
                                  .where('isSevere', isEqualTo: true)
                                  .snapshots(),
                              builder: (context, Dsnapshot) {
                                if (Dsnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                var details = Dsnapshot.data?.docs;
                                if (details!.length == 0) return Container();
                                var isStar =
                                    slist.contains(details[0]['email']);
                                return SeverePatients(
                                    details: details[0], isStar: isStar);
                              });
                        }),
                  );
                }))));
  }
}
