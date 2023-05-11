import 'package:flutter/material.dart';
import 'chat_app_bar.dart';
import 'chat_body.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildappbar(pname: "Doctor Name", screenSize: screenSize),
      body: ChatBody(),
    );
  }
}
