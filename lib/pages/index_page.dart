import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';  // 融合了ios样式风格
import 'home_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'category_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // 需要下载flutter_screenutil最新版

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

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

  final List tabBodies = [  // 底部导航栏对应的页面数组
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080.0, height: 1794.0)..init(context);  // 适配大多数的设备屏幕，这行代码一般配置在main.dart引入的第一个文件中，第一个文件配置了，其他所有文件都会生效。

    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, // 当前页索引
        items: bottomTabs, // 所有的底部导航栏的按钮
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage, // 把页面呈现
    );
  }
}