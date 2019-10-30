import 'package:flutter/material.dart';

class CommonItemDecroate {
  final Widget left;
  final Widget center;
  final Widget right;
  final double hmargin;
  //margin of verital
  final double vMargin;
  const CommonItemDecroate(
      {this.left,
      this.center,
      this.right,
      this.hmargin = 10,
      this.vMargin = 10});
}

class CommonItem extends StatefulWidget {
  final CommonItemDecroate decroate;
  CommonItem({this.decroate});
  @override
  _CommonItemState createState() => _CommonItemState();
}

class _CommonItemState extends State<CommonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: widget.decroate.hmargin,
            ),
            widget.decroate.left ?? Container(),
            SizedBox(
              width: widget.decroate.hmargin,
            ),
            widget.decroate.center ?? Container(),
            SizedBox(
              width: widget.decroate.hmargin,
            ),
            widget.decroate.right ?? Container(),
            SizedBox(
              width: widget.decroate.hmargin,
            ),
          ],
        ),
      )
    ]);
  }
}
