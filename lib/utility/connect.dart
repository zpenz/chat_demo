// import 'package:connectivity/connectivity.dart';
// import 'package:sss/action/header.dart';

// Future<bool> isConnect({OnDoCallback<bool> complete}) async{
//   var ret = await Connectivity().checkConnectivity();
//   bool real = ret!=ConnectivityResult.none;
//   if(complete!=null) complete(real);
//   return real;
// }

// Future<bool> isConnectWifi({OnDoCallback<bool> complete}) async{
//   var ret = await Connectivity().checkConnectivity();
//   bool real = ret==ConnectivityResult.wifi;
//   if(complete!=null) complete(real);
//   return real;
// }

// Future<bool> isConnectMobile({OnDoCallback<bool> complete}) async{
//   var ret = await Connectivity().checkConnectivity();
//   bool real = ret==ConnectivityResult.mobile;
//   if(complete!=null) complete(real);
//   return real;
// }

