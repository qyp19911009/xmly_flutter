import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部导航栏
      appBar: AppBar(
        elevation: 0.1,
          leading: Container(width: 60,height: 20,child: Icon(Icons.email, color: Colors.black),),
          actions: [
            Container(width: 60,height: 20,child: Icon(Icons.settings,color: Colors.black),)
          ],
          title: Text("我的",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          backgroundColor: Colors.white),

      /// 底部内容
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                              child: Row(children: [
                            Container(width: 120, color: Colors.black),
                            Expanded(child: Container(color: Colors.red))
                          ]))),
                      Expanded(flex: 1, child: Container(color: Colors.black))
                    ]))),
                Expanded(flex: 3, child: Container(color: Colors.grey))
              ]))
        ]));
  }
}
