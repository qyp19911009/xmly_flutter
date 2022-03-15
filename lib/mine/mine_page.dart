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
        appBar: AppBar(
            title: Text("我的",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600)),
            backgroundColor: Colors.white));
  }
}
