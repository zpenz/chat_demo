import 'dart:convert';
import 'dart:io';
import 'package:abc/global/get_friend_list.dart';
import 'package:abc/global/global.dart';
import 'package:abc/model/contact_people.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:abc/utility/alert.dart';
import 'package:abc/utility/load_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/html.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

class SearchFriendPage extends StatefulWidget {
  @override
  _SearchFriendPageState createState() => _SearchFriendPageState();
}

class _SearchFriendPageState extends State<SearchFriendPage> {
  List<Widget> ls = List();
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: gColor.write,
        child: Column(
          children: <Widget>[
            CommonItem(
              decroate: CommonItemDecroate(
                  left: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(this.context);
                    },
                  ),
                  center: Text(
                    "添加好友",
                    style: TextStyle(fontSize: 20),
                  ),
                  underlineLeftPadding: 0),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                      onSubmitted: (param) async {
                        loding(context, "查询中...");
                        try {
                          var dio = new Dio();
                          var ret = await dio.get(
                              "http://szp123.asuscomm.com:5002/XkUser/FindByUserAccount.php?value=${searchController.text}");
                          var obj = json.decode(ret.toString());
                          var data = obj['list'];
                          ls.clear();
                          for (var item in data) {
                            ls.add(ContractPeople(
                                id: item['user_id'],
                                name: item['user_account'],
                                right: Container(
                                  padding: const EdgeInsets.all(3),
                                child: Text(
                                  "添加",
                                  style:
                                      TextStyle(color: Colors.white),
                                ),
                                color: Colors.blueAccent[100],
                              ),
                              onpress: (param) async{
                                if(item['user_id']==gUid) {
                                  alert(context, "提示", "不能添加自己!");
                                  return;
                                }
                                ret = await dio.get(
                                "http://szp123.asuscomm.com:5002/XkUser/AddFriend.php?user=$gUid&friend=${item['user_id']}");
                                obj = json.decode(ret.toString());
                                if(obj['resultcode']!=0){
                                  alert(context, "提示", obj['data']);
                                }else{
                                  alert(context, "提示", "添加成功");
                                  getFriendList(gUid, (ls){
                                    gFriendList = ls;
                                  }, (error){
                                    print(error);
                                  });
                                }
                              },
                            ));
                          }
                          setState(() {});
                          closedialog(context);
                        } catch (e) {
                          print(e.toString());
                          closedialog(context);
                        }
                      },
                      controller: searchController,
                      onTap: () {},
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
                        hintText: "输入标识搜索",
                        focusColor: Colors.black,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Expanded(
                child: Column(
              children: this.ls,
            )),
            // Expanded(child:WebSocketDemo())
          ],
        ),
      ),
    );
  }
}

class WebSocketDemo extends StatefulWidget {
  WebSocketDemo({Key key}) : super(key: key);

  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  List _list = new List();
  String _message;
  IOWebSocketChannel _channel =
      // IOWebSocketChannel.connect("ws://echo.websocket.org");
      IOWebSocketChannel.connect("ws://szp123.asuscomm.com:8081");

//  var _channel = HtmlWebSocketChannel.connect("ws://szp123.asuscomm.com:5003");

  void _onChangedHandle(value) {
    setState(() {
      _message = value.toString();
    });
  }

  _WebSocketDemoState() {
    print(_channel);
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      _list.add('[Info] Connected Successed!');
    });

    // 监听消息
    _channel.stream.listen((message) {
      print(message);
      setState(() {
        _list.add('[Received] ${message.toString()}');
      });
    });
  }

  void _sendHandle() {
    if (_message.isNotEmpty) {
      _list.add('[Sended] $_message');
      _channel.sink.add(_message);
    }
  }

  Widget _generatorForm() {
    return Column(
      children: <Widget>[
        TextField(onChanged: _onChangedHandle),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('Send'),
              onPressed: _sendHandle,
            )
          ],
        )
      ],
    );
  }

  List<Widget> _generatorList() {
    List<Widget> tmpList = _list.map((item) => ListItem(msg: item)).toList();
    List<Widget> prefix = [_generatorForm()];
    prefix.addAll(tmpList);
    return prefix;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: _generatorList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }
}

class ListItem extends StatelessWidget {
  final String msg;
  ListItem({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
