import 'package:abc/global/global.dart';
import 'package:abc/model/contact_people.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class CommunicationContent extends StatefulWidget {
  @override
  _CommunicationContentState createState() => _CommunicationContentState();
}

class _CommunicationContentState extends State<CommunicationContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CommonItem(
          decroate: CommonItemDecroate(
              left: ClipRRect(borderRadius: BorderRadius.circular(10),
              child: Container(color: Colors.yellow[800],width: 40,height: 40,),),
              center: Text("添加好友"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 45),
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              left: ClipRRect(borderRadius: BorderRadius.circular(10),
              child: Container(color: Colors.amber[900],width: 40,height: 40,),),
              center: Text("添加群聊"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 45),
        ),
        SizedBox(
          height: 10,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              left: Text("好友"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 0),
        ),
        ContractPeople(
          name: "用户1",
        ),
        ContractPeople(
          name: "用户2",
        ),
        ContractPeople(
          name: "用户3",
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              left: Text("群聊"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 0),
        ),
        ContractPeople(
          name: "群1",
        ),
        ContractPeople(
          name: "群2",
        ),
        ContractPeople(
          name: "群3",
        ),
      ],
    );
  }
}
