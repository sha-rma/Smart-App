import 'package:flutter/cupertino.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Text("Work In Progress"),
          ),
        ),
      )
    ]));
  }
}
