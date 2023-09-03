import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
