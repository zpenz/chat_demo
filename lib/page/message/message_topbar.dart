import 'package:abc/global/global.dart';
import 'package:abc/ui/search/search_bar.dart';
import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';

class MessageTopBar extends StatefulWidget {
  @override
  _MessageTopBarState createState() => _MessageTopBarState();
}

class _MessageTopBarState extends State<MessageTopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      SizedBox(height: 10,),
      SearchBar(),
      SizedBox(height: 10,)
    ]);
  }
}
