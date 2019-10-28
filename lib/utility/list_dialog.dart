// import 'package:flutter/material.dart';
// import 'package:sss/ui/menu/menu_item.dart';

// class ListDialog extends Dialog {
//   final String title;
//   final List<MenuItem> list;
//   ListDialog({this.title, this.list});

//   @override
//   Widget build(BuildContext context) {
//     var sd = new SimpleDialog(
//       title: Text(title),
//       children: <Widget>[],
//     );
//     for (var item in list) {
//       sd.children.add(new SimpleDialogOption(
//         onPressed: () {
//           item.action(item);
//         },
//         child: Text(item.title),
//       ));
//     }
//     return sd;
//   }
// }

// void listing(BuildContext context, String title, List<MenuItem> list) {
//   ListDialog ld = ListDialog(
//     title: title,
//     list: list,
//   );
//   showDialog(
//       context: context,
//       builder: (context) {
//         return ld;
//       });
// }
