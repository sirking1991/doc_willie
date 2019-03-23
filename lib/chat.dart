import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Text(
      "Coming soon!",
      style: TextStyle(fontSize: 32),
    )));
  }
}
