import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './member_page/admin-info.dart';
import './member_page/my-order.dart';
import './member_page/my-tool.dart';
import './member_page/navigor.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 0, // 隐藏阴影
       title: Text('会员中心', style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
     ),
     body:ListView(
       children: <Widget>[
         AdminInfo(),// 个人信息部分
         Navigor(), // 导航栏
         MyOrder(), // 我的订单
         MyTool() // 我的工具
      ],
     ) ,
   );
  }
}