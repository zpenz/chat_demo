import 'package:flutter/material.dart';

class CountAdapter extends StatefulWidget {
  final int count;
  CountAdapter(this.count);
  @override
  _CountAdapterState createState() => _CountAdapterState();
}

class _CountAdapterState extends State<CountAdapter> {
  @override
  Widget build(BuildContext context) {
    if (widget.count == 0) return Container();
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: Text(
        widget.count>99?"99+":widget.count.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
