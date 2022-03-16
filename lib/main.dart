import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmly_flutter/route.dart';
import 'package:xmly_flutter/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index/index_page.dart';
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
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>
          MaterialApp(
            //... other code
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            theme: ThemeData(
              textTheme: TextTheme(
                //To support the following, you need to use the first initialization method
                  button: TextStyle(fontSize: 45.sp)
              ),
            ),
            onGenerateRoute: Routers.generateRoute,
            home: IndexPage(),
          ),
    );

  }
}
