import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartapp/screens/chat/chatScreen.dart';

class ChatInboxScreen extends StatefulWidget {
  ChatInboxScreen({super.key});
  @override
  _ChatInboxScreenState createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Future<Map<String,dynamic>> _getCurrentUserMap() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();
      return {"name":userDoc['displayName'],"role": userDoc['role'],"pList":userDoc['pList'],"dList":userDoc["dList"]};
    }
    return {};
  }
  bool _isPresentInside(String email, List<dynamic> list){
    for (var element in list) {
      if(element==email){
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    late var currentUserRole ;
    late var currentUserName ;
           late var pList,dList;
           
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF07919D),
        title: Text("Chat Inbox"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream:FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
        builder: (context,snapshotCurrentUser) {
           if (snapshotCurrentUser.connectionState == ConnectionState.waiting) {
                        Center(child:CircularProgressIndicator());
                      } else {
                        Map<String, dynamic> currUser =
                            snapshotCurrentUser.data!.data() as Map<String, dynamic>;
                        currentUserName = currUser['displayName'];
                        currentUserRole= currUser['role'];
                         pList=currUser['pList'];
            dList=currUser['dList'];
                      }
          return StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('users').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final users = snapshot.data!.docs;
                  
                    List<Widget> userWidgets = [];
                    for (var user in users) {
                      final name = user['displayName'];
                      final email = user['email'];
                      final role = user['role'];
                      final currentUser= _auth.currentUser;
                      // Only show users who have a different role than the current user
                      debugPrint(
                          "name:${name} , currentUsernName:${currentUserName}, role: $role}, currentUserRole ${currentUserRole}");
                      if (currentUser != null && name != currentUserName &&((currentUserRole =="Doctor" && _isPresentInside(email,pList))||(currentUserRole =="Patient" &&_isPresentInside(email,dList)))) {
                        final userWidget = ListTile(
                          leading: CircleAvatar(
                            foregroundColor: const Color(0xFF07919D),
                            child: Text(name[0]),
                          ),
                          title: Text(name),
                          subtitle: Text(email),
                          onTap: () {
                            // Navigate to the chat message screen with the selected user
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatMessageScreen(
                                  name: name,
                                  email: email,
                                ),
                              ),
                            );
                          },
                        );
                        userWidgets.add(userWidget);
                      }
                    }
                    return ListView(
                      children: userWidgets,
                    );
                  },
                );
        }
      )
          );
      }
  
  }

