import 'package:abc/page/readpage/readpage_bottom.dart';
import 'package:abc/page/readpage/readpage_topbar.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:abc/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadPage extends StatefulWidget {
  bool bShow = false;
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        appBar: null,
        body: Column(
          children: <Widget>[
            Screen.topSafeWidget(),
            Expanded(child:Stack(alignment: Alignment.center, children: <Widget>[
              Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    "images/read_bg.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              //center click
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.bShow = !widget.bShow;
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 100,
                  child: Row(),
                ),
              ),
              Offstage(offstage: !widget.bShow, child: ReadPageTopbar()),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: (Offstage(
                    offstage: !widget.bShow,
                    child: ReadPageBottom(),
                  )))
            ])),
          ],
        ));
  }
}
