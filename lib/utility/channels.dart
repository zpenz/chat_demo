// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sss/interface/task.dart';

// class ChannelFunc{
//   EventChannel subjectChannel;
//   ChannelFunc(String channelName){
//     subjectChannel =  EventChannel(channelName);
//   }

//   StreamSubscription instance;
//   receive(OnDoCallback event,OnDoCallback err,VoidCallback done) async{
//     instance = subjectChannel.receiveBroadcastStream().listen(event,onError: err,onDone: done);
//   }

//   clean(){
//     if(instance!=null){
//       instance.cancel();
//     }
//   }
// }

// class ChannelMethod{
//   MethodChannel channel;
//   ChannelMethod(String channelName){
//     channel = MethodChannel(channelName);
//   }

//   // invoke() async{
//   //   await channel.invokeMethod();
//   // }

// }
