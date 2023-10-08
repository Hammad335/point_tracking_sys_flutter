import 'package:flutter/material.dart';

import '../theme/colors.dart';

class TextStyles {
  static TextStyle get authButton18TextStyle {
    return const TextStyle(
      color: cWhiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.4,
    );
  }

  static TextStyle get captionPrimary18TextStyle {
    return const TextStyle(
      color: cPrimaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.2,
    );
  }
}
