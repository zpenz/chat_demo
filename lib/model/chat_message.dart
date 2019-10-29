import 'package:abc/global/global.dart';
import 'package:abc/interface/task.dart';
import 'package:abc/model/message.dart';
import 'package:abc/page/message/message_chat.dart';
import 'package:abc/ui/item/count_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatMessage {
  Widget headImg;
  List<Message> messagePool;
  // ChatMessage();
  ChatMessage(this.headImg, this.messagePool);
}

class ChatMessageWidget extends StatefulWidget {
  // final ChatMessage msgs;
  // ChatMessageWidget(this.msgs);
  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageChat()));
      },
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: gChatMargin),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        "Title",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Describe",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        "10月24日",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CountAdapter(1),
                      SizedBox(
                        height: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )),
          Container(
            height: gChatUnderlineHeight,
            color: gChatUnderlineColor,
            margin: const EdgeInsets.only(left: 60),
          )
        ],
      ),
    );
  }
}
