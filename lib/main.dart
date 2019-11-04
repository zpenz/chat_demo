import 'dart:io';

import 'package:abc/global/global.dart';
import 'package:abc/page/communication/communication.dart';
import 'package:abc/page/message/message.dart';
import 'package:abc/page/mypage/mypage.dart';
import 'package:abc/page/readpage/readpage.dart';
import 'package:abc/ui/item/bottom_item.dart';
import 'package:abc/ui/item/count_adapter.dart';
import 'package:abc/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main(){
  //  if (Platform.isAndroid) {
  //       // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  //       //     statusBarColor: color, statusBarIconBrightness: Brightness.dark);
  //       // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.black);
  //       // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //       // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  //     SystemChrome.setEnabledSystemUIOverlays([]);
  //   }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // (() async {
    //   Dio dio = new Dio();
    //   //http://192.168.10.35:5588/login/php/szp.php
    // FormData form = new FormData.fromMap({
    // 'name': 'Just testing',
    // 'passwd': '123'
    // });
    //   var ret = await dio.post("http://szp123.asuscomm.com:5001/1.php",
    //       data: form);
    //   print("-------------date:${ret.data}");
    // })();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
            // BottomNavigationBarItem(
            //     icon: BottomItem(
            //         text: "消息",
            //         child: Icon(Icons.chat),
            //         leftTopWidget: CountAdapter(10))),
            // BottomNavigationBarItem(
            //     title: Text("通讯录"), icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(
              title: Text("我的"),
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              title: Text("book"),
              icon: Icon(Icons.book),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Screen.topSafeWidget(color: Colors.white),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  // MessagePage(),
                  // Communication(),
                  MyPage(),
                  ReadPage()
                ],
              ),
            )
          ],
        ));
  }
}
