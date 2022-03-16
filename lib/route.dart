import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mine/mine_page.dart';


class Routers {
  static const String SPLASH = '/SPLASH'; // 启动页
  static const String MINE = '/MINE'; // 启动页

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MINE:
        return CupertinoPageRoute(builder: (_) => MinePageWidget());
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
