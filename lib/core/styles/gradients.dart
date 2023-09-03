import 'package:flutter/material.dart';

import '../theme/colors.dart';

class Gradients {
  static LinearGradient authContainerGradient() {
    return LinearGradient(
      colors: [
        cPrimaryColor,
        cPrimaryColor.withOpacity(0.4),
        cPrimaryColor.withOpacity(0.3),
        cPrimaryColor.withOpacity(0.2),
        cPrimaryColor.withOpacity(0.1),
        cPrimaryColor.withOpacity(0.1),
        cPrimaryColor.withOpacity(0.1),
        cWhiteColor,
        cWhiteColor,
        cWhiteColor,
        cWhiteColor,
        cWhiteColor,
        cWhiteColor,
        cWhiteColor,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
