import 'package:flutter/material.dart';

alert(BuildContext context, String title, String msg, {String detail}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 14), child: Text(msg)),
                    Offstage(
                      offstage: detail == null,
                      child: ExpansionTile(
                          trailing: null,
                          title: Text('详情'),
                          backgroundColor: Colors.white,
                          initiallyExpanded: false,
                          children: <Widget>[
                            ListTile(title: Text(detail ?? "")),
                          ]),
                    )
                  ],
                )
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
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
