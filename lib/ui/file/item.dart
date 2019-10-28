// import 'package:abc/global/global.dart';
// import 'package:abc/interface/orientation/orientation.dart';
// import 'package:abc/interface/task.dart';
// import 'package:abc/ui/menu/file_menu_item.dart';
// import 'package:abc/ui/menu/menu_item.dart';
// import 'package:flutter/material.dart';

// class FileItem {
//   String path;
//   String name;
//   String imageAddr;
//   String suffix;
//   IconData data;
//   XOrientation orientation;
//   bool bFolder = false;
//   bool bSelect = false;
//   bool bMainFolder = false;

//   bool isMusic(){
//     return this.suffix == "MP3" ;
//   }

//   bool isVideo() {
//     return this.suffix == "MP4" || this.suffix == "MOV" || this.suffix == "AVI";
//   }

//   bool isPicture() {
//     return this.suffix == "JPG" ||
//         this.suffix == "JPEG" ||
//         this.suffix == "PNG" ||
//         this.suffix == "BMP";
//   }

//   bool isPdf() {
//     return this.suffix == "PDF";
//   }

//   resolvename(String name) {
//     if (bFolder) {
//       imageAddr = "images/folder.png";
//       return;
//     }
//     imageAddr = gResolveName(name);

//     //calc suffix
//     if (this.bFolder || !this.name.contains("."))
//       this.suffix = "";
//     else {
//       this.suffix = gCut(this.name, ".", -1).value.toUpperCase();
//     }

//     //set orientation
//     // if(isPdf()) orientation = PdfOrientation();
//     // if(isPicture()) orientation = ImageOrientation();
//     // if(isVideo()) orientation = VideoOrientation();
//   }

//   FileItem(String path) {
//     this.path = path;
//     if (this.path.endsWith("/")) {
//       this.bFolder = true;
//       this.path = this.path.substring(0, this.path.length - 1);
//     }
//     this.name = this.path.substring(this.path.lastIndexOf("/") + 1);
//     this.imageAddr = resolvename(this.name);
//   }

//   Widget build(BuildContext context, State st, OnDoCallback<FileItem> ondo) {
//     resolvename(this.name);

//     return GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () {
//           if (gBSelectState) {
//             this.bSelect = !this.bSelect;
//             if (gPageStack.peek().emptySelect()) gBSelectState = false;
//             st.setState(() {});
//           } else {
//             if (this.bFolder) ondo(this);
//           }
//         },
//         onLongPress: () {
//           if (bMainFolder) return;
//           gBSelectState = true;
//           this.bSelect = !this.bSelect;
//           if (gPageStack.peek().emptySelect()) gBSelectState = false;
//           st.setState(() {});
//         },
//         child: Container(
//             child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Row(
//                       children: <Widget>[
//                         SizedBox(
//                           width: 12,
//                         ),
//                         Offstage(
//                           offstage: !gBSelectState,
//                           child: Row(children: <Widget>[
//                             Icon(
//                               this.bSelect
//                                   ? Icons.check_box
//                                   : Icons.check_box_outline_blank,
//                               color: gColor.themeBlue,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             )
//                           ]),
//                         ),
//                         SizedBox(
//                           width: 35,
//                           height: 35,
//                           child: Image.asset(
//                             this.imageAddr,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Text(
//                             name,
//                             style: TextStyle(fontSize: 17),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                       onTapUp: (detail) {},
//                       child: FittedBox(
//                         child: IconButton(
//                             padding: const EdgeInsets.all(0),
//                             icon: Icon(Icons.more_vert),
//                             onPressed: () {
//                               var oplist = new List<MenuItem>();
//                               if (!this.bMainFolder) {
//                                 oplist.add(FileMenuItem("删除", (item) {
//                                   List<FileItem> dlist = new List<FileItem>();
//                                   dlist.add(this);
//                                   closedialog(context);
//                                   // simpleDelete(dlist, st);
//                                 }));
//                                 oplist.add(FileMenuItem("重命名", (item) {
//                                   closedialog(context);
//                                   // simpleRenameFile(this, st);
//                                 }));
//                               }
//                               if (isPicture()) {
//                                 oplist.add(FileMenuItem("预览图片", (item) {
//                                   closedialog(context);
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               PreView(
//                                                   title: this.name,
//                                                   item: this)));
//                                 }));
//                               }
//                               if (isVideo()) {
//                                 oplist.add(FileMenuItem("预览视频", (item) {
//                                   closedialog(context);
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               PreView(
//                                                   title: this.name,
//                                                   item: this)));
//                                 }));
//                               }
//                               if (isPdf()) {
//                                 oplist.add(FileMenuItem("预览PDF", (item) {
//                                   closedialog(context);
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               PreView(
//                                                   title: this.name,
//                                                   item: this)));
//                                 }));
//                               }
//                               oplist.add(FileMenuItem("详情", (item) {
//                                 closedialog(context);
//                                 simpleFileInfo(this, st);
//                               }));
//                               listing(context, "选项", oplist);
//                             }),
//                       )),
//                   SizedBox(
//                     width: 3,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 1,
//               color: gColor.lightGray,
//               margin: EdgeInsets.fromLTRB(10, 0, 3, 0),
//             )
//           ],
//         )));
//   }
// }
