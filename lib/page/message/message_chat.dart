import 'package:abc/global/global.dart';
import 'package:abc/ui/screen.dart';
import 'package:abc/utility/top_bar.dart';
import 'package:flutter/material.dart';

var mapList = [
  {"text": "你好1", "identity": 0},
  {"text": "你好asdf", "identity": 1},
  {"text": "你好3", "identity": 0},
  {"text": "你好4", "identity": 1},
  {"text": "你好3", "identity": 0},
  {"text": "你好4", "identity": 1},
  {"text": "你好3", "identity": 0},
  {"text": "你好4", "identity": 1},
];

const gVpao = 10.0;
const gHpao = 16.0;

class MessageChat extends StatefulWidget {
  final ScrollController col = ScrollController();
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<MessageChat> {
  Widget buildTextField() {
    return Theme(
      data: new ThemeData(
          primaryColor: Color.fromRGBO(189, 189, 189, 1),
          hintColor: Colors.blue),
      child: TextField(
        onChanged: (String str) {},
        onSubmitted: (String str) {
          mapList.add({"text": str, "identity": 1});
          setState(() {
            widget.col.jumpTo(widget.col.position.maxScrollExtent + 50);
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
    mapList.forEach((item) {
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
          title: "Title",
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
                  controller: widget.col,
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
