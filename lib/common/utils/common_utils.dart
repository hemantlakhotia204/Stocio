import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  static screenPadding() {
    return EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w);
  }

  static contentPadding() {
    return EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w);
  }

  static color([String type= '']) {
    switch(type) {
      case 'pbg':
      case 'sbg':
        return const Color(0xffffffff);
      case 'pb':
        return const Color(0xff2f2e2e);
      case 'pt':
      case 'st':
        return const Color(0xff2f2e2e);
      default:
        return Colors.white;
    }
  }
}