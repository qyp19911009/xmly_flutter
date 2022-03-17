import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmly_flutter/utity/ui_util.dart';

import '../utity/screen.dart';

class MinePageWidget extends StatefulWidget {
  const MinePageWidget({Key? key}) : super(key: key);

  @override
  _MinePageWidgetState createState() => _MinePageWidgetState();
}

class _MinePageWidgetState extends State<MinePageWidget> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  late bool controlBottomListViewScrll;

  late ScrollController _scrollController;
  late ScrollController _scrollController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController2 = ScrollController();
    controlBottomListViewScrll = false;
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 235, 224, 1),
        /// 底部内容
        body: Stack(children: [
          Positioned(
              top: ScreenUtil().statusBarHeight ,
              left: 0,
              right: 0,
              bottom: 0,
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  switch (notification.runtimeType) {
                    case ScrollEndNotification:
                      _scrollController.addListener(() {
                        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
                          // do something
                          print("object");
                          setState(() {
                            controlBottomListViewScrll = true;
                          });
                        }
                      });
                      _scrollController.removeListener(() { });
                      print("滚动停止");
                      break;
                    default:
                      print(notification.runtimeType);
                        break;
                    }
                    return true;
                  },
                child: ListView( physics: controlBottomListViewScrll == true ? NeverScrollableScrollPhysics() : null,controller: _scrollController,children: [
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
                        Positioned(top: 70 + ScreenUtil().statusBarHeight ,left: 20,right: 20,height: 60,child: headerCenterBar())
                      ])),
                  Container(
                      height: 60,
                      color: Colors.white60,
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Container(color: Colors.white60,child: TabBar(
                            controller: _tabController, // 4 需要配置 controller！！！
                            labelColor: Colors.black,
                            isScrollable: true,
                            labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                            unselectedLabelStyle: TextStyle(fontSize: 14),
                            indicatorSize: TabBarIndicatorSize.label,
                            unselectedLabelColor: Colors.grey,
                            indicatorWeight: 4.0,
                            indicatorColor: Colors.red,
                            tabs: <Widget>[
                              Tab(text: '追更'),
                              Tab(text: '订阅'),
                              Tab(text: '历史'),
                              Tab(text: '下载'),
                            ],
                          ),))),
                  bottomBody()
                ]),
              )),
          Positioned(top: 0, left: 0, right: 0, child: getNaviBar()),
        ]));
  }

  Widget bottomBody() {
    return Container(
        height: get_KScreenH() - 280 + get_bottomSafeHeight() + 10,
        child: NotificationListener<ScrollUpdateNotification>(onNotification: (notification){
          switch (notification.runtimeType){
            case ScrollStartNotification:
              print("开始滚动222"); break;
            case ScrollUpdateNotification:
              _scrollController2.addListener(() {
                if (_scrollController2.offset >= 0.0) {
                  setState(() {
                    controlBottomListViewScrll = false;
                  });
                }
              });
              print("正在滚动"); break;
            case ScrollEndNotification:
              _scrollController2.addListener(() {
                print(_scrollController2.offset);
                
              });
              print("滚动停止2222"); break;
            default:
              print(notification.runtimeType);
              break;
          }
          return true;
        },child: ListView.builder(controller: _scrollController2,physics: controlBottomListViewScrll == false ? NeverScrollableScrollPhysics() : null,itemBuilder: _itemBuilder, itemCount: 10)));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Text('$index'),
    );
  }

  /// 顶部导航
  Widget getNaviBar() {
    return Container(
        color: Color.fromRGBO(248, 235, 224, 1),
        height: ScreenUtil().statusBarHeight + 44,
        child: Column(children: [
          Container(
            height:ScreenUtil().statusBarHeight ,
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
