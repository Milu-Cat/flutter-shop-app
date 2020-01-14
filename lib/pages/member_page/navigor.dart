import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navigor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(top:15),
        width: ScreenUtil().setWidth(1020),
        height: ScreenUtil().setHeight(200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('image/merber/shouye.png',width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(80),),
                Text('个人主页', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('image/merber/xiaoxi.png',width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(80),),
                Text('消息', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('image/merber/shoucang.png',width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(80),),
                Text('收藏', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('image/merber/guanzhu.png',width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(80),),
                Text('关注', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset('image/merber/zuji.png',width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(80),),
                Text('足迹', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
              ],
            ),
          ],
        )
      ),
    );
  }
}