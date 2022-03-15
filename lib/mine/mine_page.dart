import 'package:flutter/material.dart';

import '../utity/screen.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 235, 224, 1),

        /// 底部内容
        body: Stack(children: [
          Positioned(
              top: get_statusBarHeight(),
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(children: [
                Container(
                    height: 250,
                    child: Column(children: [
                      Expanded(
                          flex: 5,
                          child: Container(
                              child: Column(children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    child: Row(children: [
                                  getUserImage(),
                                  Expanded(child: getUserInfo())
                                ]))),
                            Expanded(
                                flex: 1, child: Container(color: Colors.black))
                          ]))),
                      Expanded(flex: 3, child: Container(color: Colors.grey))
                    ]))
              ])),
          Positioned(top: 0, left: 0, right: 0, child: getNaviBar()),
        ]));
  }

  /// 顶部导航
  Widget getNaviBar() {
    return Container(
        color: Color.fromRGBO(248, 235, 224, 1),
        height: get_naviBarHeight(),
        child: Column(children: [
          Container(
            height: get_statusBarHeight(),
            width: double.infinity,
          ),
          Row(children: [
            Expanded(child: Container()),
            InkWell(
                onTap: () {},
                child: Container(
                    width: 40, height: 40, child: Icon(Icons.email, size: 20))),
            SizedBox(width: 5),
            InkWell(
                onTap: () {},
                child: Container(
                    width: 40, height: 40, child: Icon(Icons.chat, size: 20))),
            SizedBox(width: 5),
            InkWell(
                onTap: () {},
                child: Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.settings, size: 20))),
            SizedBox(width: 5)
          ])
        ]));
  }

  /// 用户头像
  Widget getUserImage() {
    return Container(
        alignment: Alignment.center,
        width: 100,
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                'https://p3fx.kgimg.com/v2/fxuserlogo/7e83eb705e9a7dbddfbc4a265e14e018.jpg_200x200.jpg',
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              )),
          SizedBox(height: 30)
        ]));
  }
  /// 获取用户信息
  getUserInfo() {
    return Container(
      child: Column(children: [
        Expanded(flex: 2,child: Container(child: Row(children: [
          Text("设置昵称",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19)),
          Expanded(child: Container()),
          Text("我的会员",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 13,color: Colors.blueGrey)),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios,size: 12),
          SizedBox(width: 10)
        ]))),
        Expanded(flex: 3,child: Container(color: Colors.green))
      ])
    );
  }
}
