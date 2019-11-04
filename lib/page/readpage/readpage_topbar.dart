import 'package:abc/global/global.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class ReadPageTopbar extends StatefulWidget {
  @override
  _ReadPageTopbarState createState() => _ReadPageTopbarState();
}

class _ReadPageTopbarState extends State<ReadPageTopbar> {
  @override
  Widget build(BuildContext context) {
    return CommonItem(
      decroate: CommonItemDecroate(
          backgroundColor: gColor.golden,
          left: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          right: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )),
    );
  }
}
