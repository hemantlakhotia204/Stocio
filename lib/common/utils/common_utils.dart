import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  static screenPadding() {
    return EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w);
  }

  static contentPadding() {
    return EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w);
  }

  static color([String type = '']) {
    switch (type) {
      case 'pbg':
      case 'sbg':
        return const Color(0xffffffff);
      case 'pb':
        return const Color(0xff2f2e2e);
      case 'pt':
        return const Color(0xff2f2e2e);
      case 'st':
        return const Color(0xffffffff);
      case 'ba':
        return Colors.blueAccent;
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
      label: Text(label, style: TextStyle(fontSize: 16.sp),),
      contentPadding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Utils.color("pb"), width: 0.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Utils.color("pb").withOpacity(0.5), width: 0.5.w),
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
