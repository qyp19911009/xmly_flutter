import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mine/mine_page.dart';

void main() {
  runApp(MyApp());
  //只能竖
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  /// 安卓状态栏处理
  if (Platform.isAndroid) {
    var systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget()
    );
  }
}

