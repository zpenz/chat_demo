import 'package:abc/global/global.dart';
import 'package:flutter/material.dart';

class TopbarDecroate {
  final Widget suffix;
  final Widget leading;
  final Color color;
  final Color forceColor;
  final TextAlign align;
  const TopbarDecroate(
      {this.leading, this.suffix, this.color=Colors.white, this.forceColor=Colors.black,this.align=TextAlign.center});
}

class Topbar extends StatelessWidget {
  final String title;
  final TopbarDecroate decroate;
  Topbar({@required this.title, this.decroate = topbarDefalutDecroate});
  @override
  Widget build(BuildContext context) {
    double right = decroate.suffix==null?hPadding:40;
    double left  = decroate.leading==null?hPadding:40;
    EdgeInsets margin = EdgeInsets.fromLTRB(left, 15, right, 15);
    
    return Container(
        color: decroate.color,
        child: Stack(children: <Widget>[
          Container(
            // margin: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            margin: margin,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    title,
                    textAlign: decroate.align,
                    style: TextStyle(fontSize: 20, color: decroate.forceColor),
                  )),
                ]),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: decroate.leading != null ? decroate.leading : SizedBox(),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: decroate.suffix != null ? decroate.suffix : SizedBox(),
          )
        ]));
  }
}
