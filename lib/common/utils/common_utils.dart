import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  static screenPadding() {
    return EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w);
  }

  static contentPadding() {
    return EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w);
  }

  static color([String type = '']) {

    const primaryColor = Color(0xfff8f8fa);
    const secondaryColor = Color(0xff3456ff);
    const textColor = Color(0xff070928);

    switch (type) {
      case 'pbg':
        return primaryColor;
      case 'sbg':
        return Colors.white;
      case 'pb':
        return secondaryColor;
      case 'sb':
        return textColor;
      case 'pt':
        return textColor;
      case 'st':
        return textColor.withOpacity(0.7);
      case 'ba':
        return secondaryColor;
      default:
        return Colors.white;
    }
  }

  static validator(String? value, [String? type = '']) {
    String? msg, exp;

    switch (type) {
      case '':
        if (value != null && value.isEmpty) {
          msg = "Invalid field.";
        }
        break;
      case 'email':
        exp =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        break;
    }

    if (exp != null && exp.isNotEmpty && !RegExp(exp).hasMatch(value ?? '')) {
      msg = "Invalid $type field.";
    }
    return msg;
  }

  static customToast(String msg, [bool err = false]) {
    toast(msg);
  }

  static handleError(dynamic e, dynamic stack) {
    debugPrintStack(stackTrace: stack);
    customToast(e.toString(), true);
  }

  static inputDecoration({required String label, Widget? suffixIcon}) {
    return InputDecoration(
      label: Text(label, style: TextStyle(fontSize: 16.sp, color: Utils.color('pt'), letterSpacing: 2.sp),),
      contentPadding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Utils.color("sb"), width: 0.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Utils.color("sb").withOpacity(0.5), width: 0.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
      ),
    );
  }
}
