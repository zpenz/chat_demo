import 'package:abc/interface/task.dart';
import 'package:flutter/material.dart';
import 'menu_item.dart';

class FileMenuItem extends MenuItem{
  FileMenuItem(String title,OnDoCallback<MenuItem> click){
    // super.title = title;
    // super.action = click;
  }

  @override
  Widget build() {
        return Container(
      child:
      Column(children: <Widget>[
        Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: 
          Row(children: <Widget>[
         Expanded(child:
            GestureDetector(child: Row(children: <Widget>[
              SizedBox(width: 10,),
              Icon(Icons.settings),
              SizedBox(width: 10,),
              Expanded(child: Text(title,style: TextStyle(fontSize: 15),),),
            ],),onTap: (){
              action(this);
            },),),
            SizedBox(width: 3,),
          ],),
        ),
        // Container(
        //     height: 1,
        //     color: Colors.grey,
        //     margin: EdgeInsets.fromLTRB(10,0,3,0),
        // ) 
      ],)
    );
  }
    
}