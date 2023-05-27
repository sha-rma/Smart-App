import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ChatMessageScreen extends StatefulWidget {
  final String name;
  final String email;

  const ChatMessageScreen({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _ChatMessageScreenState createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();



  late User _currentUser;
  String _messageText = '';
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser!;
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  // A helper method to get the chat id between two users
  String getChatId() {
    String chatId;
    if (_currentUser.email!.compareTo(widget.email) > 0) {
      chatId = '${_currentUser.email}-${widget.email}';
    } else {
      chatId = '${widget.email}-${_currentUser.email}';
    }
    return chatId;
  }

  // A helper method to send a text message
  void sendMessage() async {
    if (_messageText.isNotEmpty) {
      // Create a new message document with the sender, receiver, text, timestamp and type
      await _firestore.collection('messages').doc(getChatId()).collection('chat').add({
        'sender': _currentUser.email,
        'receiver': widget.email,
        'text': _messageText,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'text',
      });
      // Clear the text field
      _messageController.clear();
      setState(() {
        _messageText = '';
      });
    }
  }

  // A helper method to send an image message
  void sendImage() async {
    // Pick an image from the gallery
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the image to Firebase Storage with a unique name
      File file = File(pickedFile.path);
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      await _storage.ref(fileName).putFile(file);
      // Get the download URL of the image
      String downloadURL = await _storage.ref(fileName).getDownloadURL();
      // Create a new message document with the sender, receiver, url, timestamp and type
      await _firestore.collection('messages').doc(getChatId()).collection('chat').add({
        'sender': _currentUser.email,
        'receiver': widget.email,
        'url': downloadURL,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'image',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF07919D),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name),
            Text(
              widget.email,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .doc(getChatId())
                    .collection('chat')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data!.docs;
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    final sender = message['sender'];
                    final receiver = message['receiver'];
                    final type = message['type'];
                    final isMe = sender == _currentUser.email;

                    // Create a message widget based on the type of the message
                    Widget messageWidget;
                    if (type == 'text') {
                      final text = message['text'];
                      messageWidget = TextMessage(
                        text: text,
                        isMe: isMe,
                      );
                    } else if (type == 'image') {
                      final url = message['url'];
                      messageWidget = ImageMessage(
                        url: url,
                        isMe: isMe,
                      );
                    } else {
                      messageWidget = const SizedBox.shrink();
                    }
                    messageWidgets.add(messageWidget);
                  }
                  return ListView(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageWidgets,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onChanged: (value) {
                        setState(() {
                          _messageText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: sendImage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A custom widget for displaying text messages
class TextMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const TextMessage({Key? key, required this.text, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isMe ?const Color(0xFF07919D): Colors.grey.shade300,
          borderRadius:
              isMe ? const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft : Radius.circular(15), bottomRight : Radius.circular(15)) : const BorderRadius.only(topRight : Radius.circular(15), bottomLeft : Radius.circular(15), bottomRight : Radius.circular(15)),
        ),
        child:
            Text(text, style:
                TextStyle(color:
                isMe ? Colors.white : Colors.black)),
      ),
    );
  }
}

// A custom widget for displaying image messages
class ImageMessage extends StatelessWidget {
  final String url;
  final bool isMe;

  const ImageMessage({Key? key, required this.url, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isMe ? Alignment.centerRight : Alignment.centerLeft,
      child:
          Container(margin:
              const EdgeInsets.all(8), child:
              ClipRRect(borderRadius:
                  BorderRadius.circular(15), child:
                  Image.network(url))),
    );
  }
}

