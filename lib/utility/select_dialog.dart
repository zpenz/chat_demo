import 'package:abc/interface/task.dart';
import 'package:flutter/material.dart';

selectAlert(BuildContext context, String title, String msg, OnDoCallback onok) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确认',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
                onok("");
              },
            ),
          ],
        );
      });
}
