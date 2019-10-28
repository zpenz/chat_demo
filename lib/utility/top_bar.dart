import 'package:abc/global/global.dart';
import 'package:flutter/material.dart';

class TopbarDecroate {
  final Widget suffix;
  final Widget leading;
  final Color color;
  final Color forceColor;
  const TopbarDecroate(
      {this.leading, this.suffix, this.color, this.forceColor});
}

class Topbar extends StatelessWidget {
  final String title;
  final TopbarDecroate decroate;
  Topbar({@required this.title, this.decroate = topbarDefalutDecroate});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: decroate.color,
        child: Stack(children: <Widget>[
          // SizedBox(
          //   height: 40,
          // ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    title,
                    textAlign: TextAlign.center,
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
