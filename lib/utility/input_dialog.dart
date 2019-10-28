import 'package:abc/global/global.dart';
import 'package:abc/interface/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


inputDialog(BuildContext context, String title, String msg, OnDoCallback onok) {
  TextEditingController ctl =
      TextEditingController.fromValue(TextEditingValue(text: msg));
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: ctl,
                  decoration: InputDecoration(
                      // labelText: msg,
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.cancel),
                        onTapUp: (parm){
                          ctl.text = "";
                        },),
                      filled: true,
                      fillColor: Colors.grey.shade100),
                )
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确认'),
              onPressed: () {
                onok(ctl.text);
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                closedialog(context);
              },
            )
          ],
        );
      });
}
