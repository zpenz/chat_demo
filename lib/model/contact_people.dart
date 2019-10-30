
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class ContractPeople extends StatefulWidget {
  // final bool bGroup ;
  // final int  chatid;
  final String name;

  ContractPeople({this.name});
  @override
  _ContractPeopleState createState() => _ContractPeopleState();
}

class _ContractPeopleState extends State<ContractPeople> {
  @override
  Widget build(BuildContext context) {
    // Color color = Color.fromARGB(a, r, g, b);
    return CommonItem(
      decroate: CommonItemDecroate(
          left: CircleAvatar(
            backgroundColor: Colors.green,
          ),
          center: Text(widget.name)),
    );
  }
}
