import 'package:abc/interface/task.dart';
import 'package:flutter/widgets.dart';

abstract class MenuItem<T>{
  String title;
  OnDoCallback<MenuItem<T>> action;
  MenuItem({this.title,this.action});
  Widget build();
}

