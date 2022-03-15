import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
//  计算宽度
double get_textWidth(String text, TextStyle style,double maxWidth,{int maxLines = 1}) {
  var painter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    maxLines: maxLines,
    ellipsis: '...',
  );
  painter.layout();
  double width = 0;
  if(painter.size.width > maxWidth){
    width = maxWidth;
  }else{
    width = painter.size.width;
  }
  print("object::${painter.size}");
  return width;
}

/// 设置宽度
double k_screenW(double width) {
  return ScreenUtil().setWidth(width);
}
/// 设置高度
double k_screenH(double height) {
  return ScreenUtil().setHeight(height);
}
/// 设置字体尺寸
double k_ScreenSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
/// 获取屏幕宽度
double get_KScreenW(){
  return ScreenUtil().screenWidth;
}
/// 获取屏幕高度
double get_KScreenH(){
  return ScreenUtil().screenHeight;
}
/// 获取导航高度
double get_naviBarHeight(){
  return ScreenUtil().statusBarHeight + 44;
}
/// 获取状态懒高度
double get_statusBarHeight(){
  return ScreenUtil().statusBarHeight ;
}