import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmly_flutter/route.dart';
class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({Key? key}) : super(key: key);

  @override
  _SplashPageWidgetState createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  int _timeCount = 1;
  String adTimeStr = '跳过广告3S';
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => {
          setState(() {
            if (_timeCount <= 1) {
              _timer.cancel();
              Navigator.pushReplacementNamed(context, Routers.MINE);
            } else {
              _timeCount -= 1;
              adTimeStr = '跳过广告 $_timeCount' + 'S';
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 734), // 812 - 44 - 34
        builder: () => Scaffold(body: Container(color: Colors.red,),
        ));
  }
}
