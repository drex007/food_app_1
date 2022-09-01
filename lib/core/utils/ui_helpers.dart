import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './extensions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  /// Returns a vertical SizedBox with width of [percentage] supplied
  static SizedBox squaredSizedBox(double height, double width, Widget? child) {
    if (child != null) {
      return SizedBox(height: height, width: width.wp, child: child);
    }
    return SizedBox(height: height, width: width.wp, child: child);
  }

  /// Returns a vertical SizedBox with width of [percentage] supplied
  static SizedBox verticalSizedBox(double percentage, Widget? child) {
    if (child != null) {
      return SizedBox(height: percentage.wp, child: child);
    }
    return SizedBox(height: percentage.wp);
  }

  /// Returns a horizontal SizedBox with width of [percentage] supplied
  static SizedBox horizontalSizedBox(double percentage, Widget? child) {
    if (child != null) {
      return SizedBox(width: percentage.wp, child: child);
    }
    return SizedBox(width: percentage.wp);
  }

  ///returns a three sided border radius property
  ///
  static BorderRadius threeSidedRadius(double radius) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      topLeft: Radius.circular(radius),
      // bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  ///returns a four sided border radius property
  ///
  static BorderRadius fourSidedRadius(double radius) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  static asyncAction(Function action) {
    EasyLoading.show(
        status: "Loading... ", maskType: EasyLoadingMaskType.black);
    try {
      action();
    } on DioError catch (e) {
      EasyLoading.showError(e.response.toString(),
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 5),
          dismissOnTap: true);
    }

    EasyLoading.dismiss();
  }
}
