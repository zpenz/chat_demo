import 'package:abc/global/global.dart';
import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';

class MessageTopBar extends StatefulWidget {
  @override
  _MessageTopBarState createState() => _MessageTopBarState();
}

class _MessageTopBarState extends State<MessageTopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(children:[Topbar(
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
      Stack(
        children: <Widget>[
          Row(children: [
            SizedBox(width: hPadding,),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  fillColor: gColor.lightGray,
                  focusColor: gColor.lightGray,
                  filled: true,
                  border: InputBorder.none
                  ),
            )),
            SizedBox(width: hPadding,)
          ]),
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon( 
                    Icons.search,
                    color: Colors.grey,
                  ),
                  Text(
                    "搜索",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
          // ],
          // ),
        ],
      )]);
  }
}