import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(1020),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Column(
        children: <Widget>[
          // 标题部分
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('我的工具', style: TextStyle(fontSize: ScreenUtil().setSp(33)),),
              ],
            ),
          ),
          // 导航部分
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/qiandao.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('签到', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/huanbao.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('环保', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/kefu.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('客服', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/daren.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('达人中心', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/shouhuo.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('收货地址', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
              ],
            )
          )
        ],
      )
      )
    );
  }
}