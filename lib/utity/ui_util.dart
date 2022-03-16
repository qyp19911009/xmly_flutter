import 'package:flutter/material.dart';

class UiUtil {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }
}