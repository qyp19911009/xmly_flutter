import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index/index_page.dart';
import 'mine/mine_page.dart';


class Routers {
  static const String SPLASH = '/SPLASH'; // 启动页
  static const String MINE = '/MINE'; // 启动页
  static const String INDEX = '/Index'; // 启动页

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MINE:
        return CupertinoPageRoute(builder: (_) => MinePageWidget());
      case INDEX:
        return CupertinoPageRoute(builder: (_) => IndexPage());
      default: // 找不到路由跳转到空页面并提示
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
