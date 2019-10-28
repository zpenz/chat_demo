// import 'dart:io';
// import 'package:flutter/material.dart';

// class FilePage{
//   var list =new List<FileItem>();
//   String path;
//   FilePage(this.list,this.path);

//   mainFolder(){
//     return path.isEmpty;
//   }

//   getPageName(){
//     if(path.isEmpty) return "主目录";
//     var temp = path.substring(0,path.length-1);
//     return temp.substring(temp.lastIndexOf("/")+1);
//   }

//   List<FileItem> getSelects(){
//     var ret = new List<FileItem>();
//     for (var item in list) {
//       if(item.bSelect) ret.add(item);
//     }
//     return ret;
//   }

//   clearSelects(){
//     for(int index=0;index<list.length;index++){
//       if(list[index].bSelect) list[index].bSelect = false;
//     }
//   }

//   selectAll(){
//     for(int index=0;index<list.length;index++){
//       list[index].bSelect = true;
//     }
//   }

//   bool emptySelect(){
//     return getSelects().length==0;
//   }

//   bool anySelect(){
//     return getSelects().length==list.length;
//   }

//   refresh(State sw,{bool show=true}) async{
//     gRefreshState(sw);
//     if(show) loding(sw.context, "刷新中...");
//     var erf = (err){
//       if(show) closedialog(sw.context);
//       alert(sw.context, "错误", "刷新失败! "+err.toString());
//     };
//     var suc = (ls){
//       if(show) closedialog(sw.context);
//       list = ls.list;
//       sw.setState((){});
//     };

//     if(mainFolder()){
//       getMainFolder((err){
//         erf(err);
//       }, (ls){
//         suc(ls);
//       });
//     }else{
//       getSubFile(path, (err){
//         erf(err);
//       }, (ls){
//         suc(ls);
//       });
//     }
//   }
// }
