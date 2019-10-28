import 'package:flutter/material.dart';

abstract class XOrientation<T> {
  void init(State st,T other);
  void dispose(State st,T other);
  // Widget buildLandscape(State st, T other);
  // Widget buildNormal(State st, T other);
  bool bLandSpace=false;
  Widget build(State st, T other);
}
