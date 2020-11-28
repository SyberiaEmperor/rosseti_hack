import 'package:flutter/material.dart';

class ResponsiveSize {
  static double _width = 360;
  static double _height = 740;
  static void init({@required double height, @required double width}) {
    _width = width;
    _height = height;
  }

  static double width(num value) {
    return value * (_width / 360.0);
  }

  static double height(num value) {
    return value * (_height / 740.0);
  }
}

extension ResponsiveOnNum on num {
  num get width => ResponsiveSize.width(this);
  num get height => ResponsiveSize.height(this);
}