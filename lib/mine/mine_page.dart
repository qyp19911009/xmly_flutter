import 'package:flutter/material.dart';

import '../utity/screen.dart';

class MinePageWidget extends StatefulWidget {
  const MinePageWidget({Key? key}) : super(key: key);

  @override
  _MinePageWidgetState createState() => _MinePageWidgetState();
}

class _MinePageWidgetState extends State<MinePageWidget> {
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
                    height: 280,
                    child: Stack(children: [
                      Positioned(top: 0,left: 0,right: 0,height: 150,child: Container(
                          height: 100,
                            child: Container(
                                child: Row(children: [
                                  getUserImage(),
                                  Expanded(child: getUserInfo())
                                ])))),
                      Positioned(bottom: 0,left: 0,right: 0,height: 130,child: Container(color: Colors.white,child: headerBottomBar())),
                      Positioned(top: 70 + get_statusBarHeight(),left: 20,right: 20,height: 60,child: headerCenterBar())
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
  Widget getUserInfo() {
    return Container(
        child: Column(children: [
          Expanded(flex: 2,child: Container(child: Row(children: [
            Text("设置昵称",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19)),
            Expanded(child: Container()),
            Text("我的会员",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 13,color: Colors.blueGrey)),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios,size: 12,color: Colors.blueGrey),
            SizedBox(width: 10)
          ]))),
          Expanded(flex: 3,child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            getUserInfoBottomBar("收听小时","5"),
            SizedBox(width: 10),
            getUserInfoBottomBar("粉丝","0"),
            SizedBox(width: 10),
            getUserInfoBottomBar("关注","0")
          ])))
        ])
    );
  }
  Widget getUserInfoBottomBar(String str, String numStr) {
    return Container(
        child: Column(children: [
      Container(child: Text(numStr,style: TextStyle(fontWeight: FontWeight.w500))),
      SizedBox(height: 5),
      Container(child: Text(str,style: TextStyle(color: Colors.grey)))
    ]));
  }
  /// header 中间栏目
  Widget headerCenterBar() {
    return Container(decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 1.0)
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.white),
      child: Row(children: [
        Expanded(child: Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/headerCenterBarGreat.png",
                            width: 30, height: 30),
                        Text("创作中心",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18))
                      ]))),
          Container(margin: EdgeInsets.only(top: 10,bottom: 10),width: 1, color: Colors.grey),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/headerCenterBarPlay.png",
                            width: 30, height: 30),
                        Text("创作中心",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18))
                      ])))
        ]));
  }
  /// header Bottom bar
  Widget headerBottomBar() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          headerBottomBarItem("images/headerCenterBarPlay.png",'积分签到'),
          headerBottomBarItem("images/headerCenterBarPlay.png",'钱包'),
          headerBottomBarItem("images/headerCenterBarPlay.png",'免流量'),
          headerBottomBarItem("images/headerCenterBarPlay.png",'商城'),
          headerBottomBarItem("images/headerCenterBarPlay.png",'全部服务'),
        ]
      ),
    );
  }

  Widget headerBottomBarItem(String imgStr,String text) {
    return Expanded(child: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgStr,
              width: 50, height: 50),
          SizedBox(height: 5),
          Text(text,
              style: TextStyle(fontSize: 15))
        ])));
  }
}
