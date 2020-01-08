import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';  // 融合了ios样式风格
import 'home_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'category_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // 需要下载flutter_screenutil最新版
import '../provide/currentIndex.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
 // 保持页面状态加入代码--start
  PageController _pageController;
  // 保持页面状态加入代码--end

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];

  final List<Widget> tabBodies = [  // 底部导航栏对应的页面数组
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0; //当前页面的索引默认是首页（0）
  var currentPage;  // 当前页面

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // 保持页面状态加入代码--start
    _pageController=new PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
    });
    // 保持页面状态加入代码--end
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080.0, height: 1794.0)..init(context);  // 适配大多数的设备屏幕，这行代码一般配置在main.dart引入的第一个文件中，第一个文件配置了，其他所有文件都会生效。

    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');

    // int currentIndex= Provide.value<CurrentIndexProvide>(context).currentIndex;
    return Provide<CurrentIndexProvide>(
      builder: (context,child,val){
        int currentIndex= Provide.value<CurrentIndexProvide>(context).currentIndex;
        return     
        Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex, // 当前页索引
            items: bottomTabs, // 所有的底部导航栏的按钮
            onTap: (index){
              // setState(() {
              //   currentIndex = index;
              //   currentPage = tabBodies[currentIndex];
              // });
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),

          // body: currentPage // 未实现保存页面状态之前代码

          // 保持页面状态加入代码--start
          body: IndexedStack(  //IndexedStack 作用是保持页面状态
            index: currentIndex,
            children: tabBodies
          )
          // 保持页面状态加入代码--end
        );
    });
  }
}