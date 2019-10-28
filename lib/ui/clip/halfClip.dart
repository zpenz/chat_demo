import 'package:flutter/material.dart';

class HalfClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);

    var pt = Offset(size.width/2,size.height);
    var ept = Offset(size.width,size.height-50);

    path.quadraticBezierTo(pt.dx, pt.dy, ept.dx, ept.dy);
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}