import 'package:abc/page/communication/communication_topbar.dart';
import 'package:flutter/material.dart';

class Communication extends StatefulWidget {
  @override
  _CommunicationState createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            color: Colors.white,
            child: Column(
      children: <Widget>[CommunicationTopBar()],
    )));
  }
}
