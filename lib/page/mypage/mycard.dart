import 'package:abc/global/global.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:abc/ui/line/under_line.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String nickName;
  final String info1;
  final String info2;
  MyCard({this.info1 = "", this.info2 = "", this.nickName = ""});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  List<String> imageUrl = [
    'http://szp123.asuscomm.com:5002/1.jpeg',
    'http://szp123.asuscomm.com:5002/2.jpeg',
    'http://szp123.asuscomm.com:5002/3.jpeg',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[50],
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Card(
          margin: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              CommonItem(
                decroate: CommonItemDecroate(
                    underlineColor: Colors.transparent,
                    left: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.nickName,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.nickName,
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.nickName,
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 15),
                        ),
                      ],
                    ),
                    right: 
                    GestureDetector(behavior: HitTestBehavior.opaque,
                    onTapUp: (par){
                      setState(() {
                        index = index%2;
                        index++;
                      });
                    },
                    child: 
                    CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl[index]),
                        backgroundColor: Colors.blue,
                        child: Center(
                          child: Text(
                            widget.nickName.substring(0, 1),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ))
                       ,)
                        ),
              ),
              SizedBox(
                height: 50,
              ),
              UnderLine(),
              CommonItem(
                decroate: CommonItemDecroate(
                    left: Text("我的名片"),
                    right: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                    )),
              )
            ],
          ),
        ));
  }
}
