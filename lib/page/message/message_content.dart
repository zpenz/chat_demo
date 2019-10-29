import 'package:abc/model/chat_message.dart';
import 'package:flutter/material.dart';

class MessageContent extends StatefulWidget {
  @override
  _MessageContentState createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
      ChatMessageWidget(),
    ],);
  }
}