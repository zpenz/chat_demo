import 'package:abc/page/mypage/mycard.dart';
import 'package:abc/page/mypage/mypage_content.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.,
      child: Column(
        children: <Widget>[
          MyCard(
            info1: "info1",
            info2: "info2",
            nickName: "pSong",
          ),
          Expanded(
            child: MyPageContent(),
          )
        ],
      ),
    );
  }
}
