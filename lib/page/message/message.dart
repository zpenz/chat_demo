import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Topbar(
            title: "chat",
            decroate: TopbarDecroate(
              align: TextAlign.start,
              suffix: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )),
        Row(
          children: <Widget>[Expanded(child: TextField())],
        )
      ],
    );
  }
}
