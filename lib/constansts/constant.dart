import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/screens/chat/chatInbox.dart';
import '../screens/Results/resultsMain.dart';
import 'package:url_launcher/url_launcher.dart';

TextField reusableTextField(String text, bool isPasswordType) {
  return TextField(
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: text,
      hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.2)),
      enabled: true,
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: new BorderSide(width: 2, color: Colors.black),
        borderRadius: new BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            new BorderSide(width: 2, color: Colors.black.withOpacity(0.1)),
        borderRadius: new BorderRadius.circular(15),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Padding reusableContainer(double hei, double wid, double num, String val) {
  return Padding(
    padding: EdgeInsets.only(top: hei * 0.365 * num, left: wid * 0.0833),
    child: Container(
      height: hei * 0.073,
      width: wid * 0.833,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.black.withOpacity(0.1))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20),
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              String pname;
              if (snapshot.connectionState == ConnectionState.waiting) {
                pname = "";
              } else {
                Map<String, dynamic> nam =
                    snapshot.data!.data() as Map<String, dynamic>;
                pname = nam[val];
              }
              return Text(
                pname,
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(0.5)),
              );
            }),
      ),
    ),
  );
}

Future updatesList({required String pId, required bool isStar}) async {
  if (isStar) {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "sList": FieldValue.arrayUnion([pId]),
    });
  } else {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "sList": FieldValue.arrayRemove([pId])
    });
  }
}

// ignore: must_be_immutable
class SeverePatients extends StatefulWidget {
  var details;
  bool isStar;
  SeverePatients({required this.details, required this.isStar});

  @override
  State<SeverePatients> createState() => _SeverePatientsState();
}

class _SeverePatientsState extends State<SeverePatients> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              width: screenSize.width * 0.83,
              height: screenSize.height * 0.22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Container(
                      height: screenSize.width * 0.3,
                      width: screenSize.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.3),
                          image: DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name : " + widget.details['displayName'],
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Age : " + widget.details['age'],
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Phone : " + widget.details['phone'],
                              style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(screenSize.width * 0.0,
                                screenSize.height * 0.01, 0, 0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatInboxScreen()));
                                    },
                                    icon: Icon(Icons.chat_rounded)),
                                IconButton(
                                    onPressed: () {
                                      LaunchUrl(widget.details['phone']);
                                    },
                                    icon: Icon(Icons.phone_rounded)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.isStar = !widget.isStar;
                                        updatesList(
                                            pId: widget.details['email'],
                                            isStar: widget.isStar);
                                      });
                                    },
                                    icon: Icon(widget.isStar
                                        ? Icons.star
                                        : Icons.star_border_outlined)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            details: widget.details,
                            answers: [
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0,
                              4.0
                            ],
                          )));
            },
          ),
        ],
      ),
    );
  }
}

Future<void> LaunchUrl(String phoneNumber) async {
  // final phoneNumber = '9946513189'; // Replace with the desired phone number
  final phoneUrl = 'tel:$phoneNumber';
  final Uri _url = Uri.parse(phoneUrl);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
