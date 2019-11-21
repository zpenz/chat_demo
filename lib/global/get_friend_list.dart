
import 'dart:async';
import 'dart:convert';

import 'package:abc/interface/task.dart';
import 'package:abc/model/contact_people.dart';
import 'package:dio/dio.dart';

getFriendList(int id,OnDoCallback<List<ContractPeople>> complete,OnDoCallback<String> error)
async{
    try {
      var ls = List<ContractPeople>();
      Dio dio =  Dio();
      var ret = await dio.get("http://szp123.asuscomm.com:5002/XkUser/GetFriendList.php?id=$id");
      var data = json.decode(ret.toString());
      print(data.toString());
      if(data['resultcode']!=0) {error("GetFriendList error ${data['resultcode']}"); return;}
      for (var item in data['data']) {
        ls.add(ContractPeople(id: item['user_id'],name: item['user_account'],));
      }
      complete(ls);
      print(ls.length);
    } catch (e) {
      error(e.toString());
    }
}