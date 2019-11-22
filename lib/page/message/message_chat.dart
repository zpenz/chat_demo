import 'dart:convert';
import 'package:abc/global/global.dart';
import 'package:abc/model/Observer.dart';
import 'package:abc/model/chat_message_model.dart';
import 'package:abc/model/contact_people.dart';
import 'package:abc/ui/screen.dart';
import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

const gVpao = 10.0;
const gHpao = 16.0;

class Test extends Observer<ChatMessage>{
  @override
  update(ChatMessage data) {
    // TODO: implement update
    return null;
  }
}


class MessageChat extends StatefulWidget {
  final ContractPeople friend;

  MessageChat({this.friend});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<MessageChat> with Observer<ChatMessage> {

  final ScrollController col = ScrollController();
  // IOWebSocketChannel _channel = IOWebSocketChannel.connect("ws://szp123.asuscomm.com:8081");
  var messageList = [];
  int flag = 0;

  @override
  update(ChatMessage data) {
      setState(() {
        messageList.add({"text": data.msg, "identity": this.widget.friend.id});
      });
  }

  @override
  void initState() {
    super.initState();
    MyObserver ob = new MyObserver();
    ob.register(Test());
    gMyObserver.register(Test());
    // gChannel.stream.listen((message) {
    //   print(message);
    //   setState(() {
    //     messageList.add({"text": message.toString(), "identity": flag.hashCode});
    //     flag=!flag;
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    gChannel.sink.close();
  }

  Widget buildTextField() {
    return Theme(
      data: new ThemeData(
          primaryColor: Color.fromRGBO(189, 189, 189, 1),
          hintColor: Colors.blue),
      child: TextField(
        onChanged: (String str) {},
        onSubmitted: (String str) {
          gChannel.sink.add(json.encode({"from":gUid,"send_to":this.widget.friend.id,"msg":str}));
          setState(() {
            col.jumpTo(col.position.maxScrollExtent + 50);
          });
        },
        style: TextStyle(
          fontSize: 20.0,
          color: Color.fromRGBO(85, 85, 85, 1),
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: null,
            focusColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }

  List<Widget> writeList() {
    var ret = <Widget>[];
    messageList.forEach((item) {
      if (item['identity'] == 0) {
        ret.add(
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          SizedBox(
            width: 5,
          ),
          CircleAvatar(backgroundColor: Colors.blue,),
          SizedBox(
            width: 5,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(gHpao,gVpao,gHpao,gVpao),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  color: gColor.lightGray,
                  // image: 
                  // DecorationImage(
                  //     image: ExactAssetImage("images/left_pao.jpg"),
                  //     fit: BoxFit.fill
                  //     )
                 ),
              child: Container(
                child: Text(
                  item['text'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )),
          Expanded(
            child: SizedBox(),
          ),
        ]));
      } else {
        ret.add(
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(gHpao,gVpao,gHpao,gVpao),
              decoration: BoxDecoration(
                  border: Border(right: BorderSide.none),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  color: Colors.blueAccent[100],
                  // image: DecorationImage(
                  //     image: ExactAssetImage("images/right_pao.png"),
                  //     fit: BoxFit.fill)
                      ),
              child: Container(
                child: Text(
                  item['text'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(backgroundColor: gColor.lightGray,),
          SizedBox(
            width: 5,
          )
        ]));
      }
      ret.add(SizedBox(
        height: 10,
      ));
    });
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Screen.topSafeWidget(color: Colors.white),
        Topbar(
          title: this.widget.friend.name,
          decroate: TopbarDecroate(
              leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[900],
            ),
          ),suffix: IconButton(onPressed: (){},icon: Icon(Icons.more_horiz,color: Colors.grey[900]))),
        ),
        Container(
          height: gChatUnderlineHeight,
          color: gChatUnderlineColor,
        ),
        SizedBox(height: 3,),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                //background
                // Image.asset(
                //   "images/bk.jpg",
                //   fit: BoxFit.cover,
                // ),
                ListView(
                  controller: col,
                  children: writeList(),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Color.fromRGBO(240, 240, 240, 1),
          height: 54,
          child: Row(
            children: <Widget>[
              SizedBox(width: 8),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2.5)),
                  child: Icon(
                    Icons.keyboard_voice,
                    // color: Color.fromRGBO(127, 132, 135, 1),
                    color: Colors.grey[900],
                    size: 25,
                  )),
              SizedBox(width: 8),
              Expanded(
                child: buildTextField(),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.mood,
                color: Colors.grey[900],
                // color: Color.fromRGBO(127, 132, 135, 1),
                size: 35,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.control_point,
                color: Colors.grey[900],
                // color: Color.fromRGBO(127, 132, 135, 1),
                size: 35,
              ),
              SizedBox(width: 5)
            ],
          ),
        ),
      ],
    ));
  }


}
