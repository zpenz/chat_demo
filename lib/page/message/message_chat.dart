import 'package:abc/ui/screen.dart';
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
            hintText: '请输入...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
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
            width: 8,
          ),
          Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  // color: Colors.transparent,
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: ExactAssetImage("images/left_pao.jpg"),
                      fit: BoxFit.fill)),
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
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: ExactAssetImage("images/right_pao.png"),
                      fit: BoxFit.fill)),
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
            width: 8,
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
        Screen.topSafeWidget(),
        Container(
          color: Colors.black,
          height: 40,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              Text(
                '微信',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "联系人",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
              Icon(
                Icons.people,
                color: Colors.white,
              ),
              SizedBox(width: 10)
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  "images/bk.jpg",
                  fit: BoxFit.cover,
                ),
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
              SizedBox(width: 5),
              Icon(
                Icons.rss_feed,
                color: Color.fromRGBO(127, 132, 135, 1),
                size: 34,
              ),
              SizedBox(width: 5),
              Expanded(
                child: buildTextField(),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.mood,
                color: Color.fromRGBO(127, 132, 135, 1),
                size: 34,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.control_point,
                color: Color.fromRGBO(127, 132, 135, 1),
                size: 34,
              ),
              SizedBox(width: 5)
            ],
          ),
        ),
      ],
    ));
  }
}
