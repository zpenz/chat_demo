import 'dart:convert';
// typedef dynamic OnCall(List ls);

// class VarargsFunction extends Function {
//   OnCall _onCall;

//   VarargsFunction(this._onCall);

//   call() => _onCall([]);

//   @override
//   noSuchMethod(Invocation invocation) {
//     final arguments = invocation.positionalArguments;
//     return _onCall(arguments);
//   }
// }

class XJson {
  static conver(List args) {
    assert(args.length % 2 == 0);
    if (args.length % 2 != 0) {
      throw Exception(
          "------------------------args%2!=0------------------------");
    }

    var map = {};
    for (int index = 0; index < args.length; index += 2) {
      var elist = new List();
      if (args[index + 1] is List) {
        if (args[index + 1].length == 0)
          map.addAll({
            args[index]: [{}]
          });
        else {
          for (int index2 = 0; index2 < args[index + 1].length; index2 += 2) {
            if (args[index + 1][index2 + 1] is List) {
              elist.add({
                args[index + 1][index2]: conver(args[index + 1][index2 + 1])
              });
            } else {
              elist.add(
                  {args[index + 1][index2]: (args[index + 1][index2 + 1])});
            }
          }
          map.addAll({args[index]: elist});
        }
      } else {
        map.addAll({args[index]: (args[index + 1])});
      }
    }
    return map;
  }
}

jsonSe(List args) {
  return json.encode(XJson.conver(args));
}

jsonL(List list) {}
