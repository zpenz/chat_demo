import 'package:flutter/material.dart';
import 'package:abc/global/global.dart';

class LoadDialog extends Dialog{
  final String text;

  LoadDialog({this.text});
  
  @override
  Widget build(BuildContext context) {
    return Material(
      type:MaterialType.transparency,
      child: Center(child: 
      SizedBox(
        width: 120.0,
        height: 120.0,
        child: Container(
          decoration: ShapeDecoration(
            color: gColor.write,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(padding: const EdgeInsets.only(top: 20),
                child: Text(text,style: TextStyle(fontSize: 12.0)),)
              ],),
        ),)
      ,)
    );
  }
}

void loding(BuildContext context,String title) {
  LoadDialog ld = LoadDialog(text: title,);
  showDialog(context: context,
      builder: (context){
        return ld;
      }
  );
}


