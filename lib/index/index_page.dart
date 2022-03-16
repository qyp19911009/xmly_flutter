import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../mine/mine_page.dart';
import '../utity/ui_util.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin{
  int currentIndex = 0;
  late List<Widget> _pages;
  final _pageController = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [HomePage(),HomePage(), HomePage(),MinePageWidget()];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _pageChanged,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index]),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          unselectedFontSize: 11.0,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                label: '首页',
                icon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black26),
                activeIcon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black)),
            BottomNavigationBarItem(
                label: '附近',
                icon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black26),
                activeIcon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black)),
            BottomNavigationBarItem(
                label: '发现',
                icon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black26),
                activeIcon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black)),
            BottomNavigationBarItem(
                label: '我的',
                icon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black26),
                activeIcon: Image.asset(UiUtil.getImgPath('headerCenterBarPlay'),width: 25,height: 25,color: Colors.black)),
          ],
        ),
      ),
    );
  }

  void _pageChanged(int index) {
    setState(() {
      if (currentIndex != index) currentIndex = index;
    });
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}
