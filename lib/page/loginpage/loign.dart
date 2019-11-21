import 'dart:convert';
import 'package:abc/global/get_friend_list.dart';
import 'package:abc/global/global.dart';
import 'package:abc/page/communication/communication.dart';
import 'package:abc/page/message/message.dart';
import 'package:abc/page/mypage/mypage.dart';
import 'package:abc/ui/item/bottom_item.dart';
import 'package:abc/ui/item/count_adapter.dart';
import 'package:abc/ui/screen.dart';
import 'package:abc/utility/alert.dart';
import 'package:abc/utility/load_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: this._currentIndex,
          inactiveColor: Colors.black,
          activeColor: gColor.themeBlue,
          items: [
            BottomNavigationBarItem(
                icon: BottomItem(
                    text: "消息",
                    child: Icon(Icons.chat),
                    leftTopWidget: CountAdapter(10))),
            BottomNavigationBarItem(
                title: Text("通讯录"), icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(
              title: Text("我的"),
              icon: Icon(Icons.settings),
            ),
            // BottomNavigationBarItem(
            //   title: Text("book"),
            //   icon: Icon(Icons.book),
            // )
          ],
        ),
        body: Column(
          children: <Widget>[
            Screen.topSafeWidget(color: Colors.white),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  MessagePage(),
                  Communication(),
                  MyPage(),
                  // ReadPage()
                ],
              ),
            )
          ],
        ));
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController accountControl = new TextEditingController(text:"");
  TextEditingController passwordControl = new TextEditingController(text:"");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text("用户名"),
            SizedBox(
              height: 4,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: accountControl,
                    onTap: () {},
                    onEditingComplete: () {},
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(3, 10, 3, 10),
                        hintText: "请输入用户名",
                        focusColor: Colors.black,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("密码"),
            SizedBox(
              height: 4,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: passwordControl,
                    onTap: () {},
                    onEditingComplete: () {},
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(3, 10, 3, 10),
                        hintText: "请输入密码",
                        focusColor: Colors.black,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(children:[Expanded(
              child: FlatButton(
                color: gColor.lightGray,
                child: Text("登录"),
                onPressed: () async{
                  loding(context, "登录中...请稍后");
                  Dio dio =new Dio();
                  var ret = await dio.get("http://szp123.asuscomm.com:5002/XkUser/login.php?account=${accountControl.text}&password=${passwordControl.text}");
                  var obj = json.decode(ret.toString());
                  print(obj);

                  //get friend list
                  getFriendList(obj['user_id'], (rls){
                    gFriendList = rls;
                  }, (error){
                    print(error);
                  });
                  closedialog(context);
                  if(obj['total_count']!=0){
                    alert(context, "提示", "登录成功!");
                    gAccount  = accountControl.text;
                    gPassword = passwordControl.text; 
                    gUid = obj['user_id'];
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
                  }else{
                    alert(context, "提示", "登录失败!");
                  }
                },
              ),
            )])
          ],
        ),
      ),
    );
  }
}
