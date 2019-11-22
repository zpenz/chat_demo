import 'package:abc/global/get_friend_list.dart';
import 'package:abc/global/global.dart';
import 'package:abc/model/contact_people.dart';
import 'package:abc/page/message/message_chat.dart';
import 'package:abc/page/searchpage/search_friend_page.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class CommunicationContent extends StatefulWidget {
  @override
  _CommunicationContentState createState() => _CommunicationContentState();
}

class _CommunicationContentState extends State<CommunicationContent> {
  @override
  Widget build(BuildContext context) {
    var friendList = ListView.builder(
      shrinkWrap: true,
      itemCount: gFriendList.length,
      itemBuilder: (bc, index) {
        return ContractPeople(
          id: gFriendList[index].id,
          name: gFriendList[index].name,
          onpress: (param) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageChat(
                    friend: gFriendList[index],
                  ),
                ));
          },
        );
      },
    );

    return ListView(
      children: <Widget>[
        CommonItem(
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SearchFriendPage()));
          },
          decroate: CommonItemDecroate(
              left: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.yellow[800],
                  width: 40,
                  height: 40,
                ),
              ),
              center: Text("添加好友"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 45),
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              left: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.amber[900],
                  width: 40,
                  height: 40,
                ),
              ),
              center: Text("添加群聊"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 45),
        ),
        SizedBox(
          height: 10,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              left: Text("我的好友"),
              underlineColor: gColor.lightGray,
              underlineLeftPadding: 0),
        ),
        friendList,
        CommonItem(
          decroate: CommonItemDecroate(
              left: Text("我的群聊"),
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
