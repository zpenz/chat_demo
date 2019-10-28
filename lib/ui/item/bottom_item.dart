import 'package:abc/interface/task.dart';
import 'package:flutter/material.dart';

class BottomItem extends StatefulWidget {
  final String text;
  final Widget child;
  final Widget leftTopWidget;
  final OnDoCallback<_BottomItemState> onPress;

  BottomItem({this.text, this.child, this.leftTopWidget, this.onPress});
  @override
  _BottomItemState createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onPress == null
            ? null
            : () {
                if (widget.onPress != null) widget.onPress(this);
              },
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 2,
                    ),
                    Offstage(
                        offstage: widget.child == null, child: widget.child),
                    Text(widget.text)
                  ])),
            ),
            Positioned(
              right: 0,
              top: 2,
              child: Offstage(
                  offstage: widget.leftTopWidget == null,
                  child: widget.leftTopWidget),
            )
          ],
        ));
  }
}
