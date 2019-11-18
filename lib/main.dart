import 'package:abc/page/loginpage/loign.dart';
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
      home: 
        LoginPage()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

