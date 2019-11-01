import 'package:abc/page/readpage/readpage_bottom.dart';
import 'package:abc/page/readpage/readpage_topbar.dart';
import 'package:abc/ui/item/common_item.dart';
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
    return Stack(alignment: Alignment.center, children: <Widget>[
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Image.asset(
          //   "images/read_bg.png",
          //   fit: BoxFit.fill,
          // ),
        ],
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            widget.bShow = !widget.bShow;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 100,
          color: Colors.black,
          child: Row(),
        ),
      ),
      // Positioned(
      //   left: 0,
      //   right: 0,
      //   top: 0,
      //   bottom: 0,
      //   child:
      //   // GestureDetector(
      //   //   onTap: () {
      //   //     setState(() {
      //   //       widget.bShow = !widget.bShow;
      //   //     });
      //   //   },
      //   //   behavior: HitTestBehavior.opaque,
      //   //   child: Container(
      //   //     height: 30,
      //   //     color: Colors.black,
      //   //     //   child:Row(
      //   //     //   children: <Widget>[
      //   //     //     SizedBox(
      //   //     //       height: 30,
      //   //     //     )
      //   //     //   ],
      //   //     // )
      //   //   ),
      //   // ),
      // ),
      Offstage(offstage: !widget.bShow, child: ReadPageTopbar()),
      Positioned(
          bottom: 0,
          child: (Offstage(
            offstage: !widget.bShow,
            child: ReadPageBottom(),
          )))
    ]);
  }
}
