
import 'package:flutter/material.dart';

class XIcon extends StatelessWidget {
  final String res;
  final double size;
  final IconData other;
  XIcon({this.res,this.size=25,this.other});

  @override
  Widget build(BuildContext context) {
    SizedBox sb;
    if(this.res!=null)
    {
      sb=SizedBox(
        child: 
          Image.asset(this.res,fit:BoxFit.fill),
        height: size,
        width: size,
      );
    }
    else if(this.other!=null){
      sb=SizedBox(
        child: 
          Icon(this.other),
          height: size,
        width: size,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: sb??Container(),
    );
  }
}