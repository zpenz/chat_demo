import 'package:abc/global/global.dart';
import 'package:flutter/material.dart';

class UnderLine extends StatelessWidget {
  final Color color;
  final double height;
  final double left;
  final double right;
  UnderLine({this.color=gColor.lightGray,this.height=1,this.left=0,this.right=0});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      height: this.height,
      margin: EdgeInsets.fromLTRB(this.left, 0, this.right, 0),
    );
  }
}