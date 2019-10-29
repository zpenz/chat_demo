import 'package:abc/page/message/message_content.dart';
import 'package:abc/page/message/message_topbar.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      MessageTopBar(),
      Expanded(child:MessageContent()),
      SizedBox(height: 1,)
    ]);
  }
}
