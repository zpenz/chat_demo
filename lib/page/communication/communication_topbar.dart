import 'package:abc/ui/search/search_bar.dart';
import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';

class CommunicationTopBar extends StatefulWidget {
  @override
  _CommunicationTopBarState createState() => _CommunicationTopBarState();
}

class _CommunicationTopBarState extends State<CommunicationTopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Topbar(
          title: "chat 好友",
          decroate: TopbarDecroate(
              suffix: Container(
            child: Center(child: Text("添加好友")),
            margin: const EdgeInsets.only(right: 10),
          )),
        ),
        SizedBox(height: 10,),
        SearchBar(),
        SizedBox(height: 10,)
      ],
    );
  }
}
