import 'package:abc/global/global.dart';
import 'package:abc/ui/item/bottom_item.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class ReadPageBottom extends StatefulWidget {
  @override
  _ReadPageBottomState createState() => _ReadPageBottomState();
}

class _ReadPageBottomState extends State<ReadPageBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: gColor.golden,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(children: <Widget>[
          CommonItem(decroate: CommonItemDecroate(
            left: Text("上一章",style: TextStyle(color: gColor.lightGray),),
            // center: Expanded(child:SizedBox()),
            right: Text("下一章",style: TextStyle(color: gColor.lightGray)),
            underlineLeftPadding: 0
          ),),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomItem(
              forceColor: Colors.white,
              text: "目录",
              child: Icon(Icons.reorder,color: Colors.white,),
            ),
            BottomItem(
              forceColor: Colors.white,
              text: "选项",
              child: Icon(Icons.format_bold,color: Colors.white),
            ),
            BottomItem(
              forceColor: Colors.white,
              text: "亮度",
              child: Icon(Icons.highlight,color: Colors.white),
            ),
            BottomItem(
              forceColor: Colors.white,
              text: "阅读模式",
              child: Icon(Icons.record_voice_over,color: Colors.white),
            ),
            BottomItem(
              forceColor: Colors.white,
              text: "更多",
              child: Icon(Icons.more_horiz,color: Colors.white),
            ),
        ],)
      ],),
    );
  }
}