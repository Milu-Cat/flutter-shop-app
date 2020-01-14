import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(1020),
        // height: ScreenUtil().setHeight(1),
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
                Text('我的订单', style: TextStyle(fontSize: ScreenUtil().setSp(33)),),
                InkWell(
                  onTap: (){},
                  child: Text('全部 >', style: TextStyle(fontSize: ScreenUtil().setSp(25)),),
                )
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
                    Image.asset('image/merber/daifu.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('待付款', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/daifa.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('待发货', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/daishou.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('待收货', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/pingjia.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('评价', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('image/merber/shouhou.jpg',width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),),
                    Text('退款售后', style: TextStyle(fontSize: ScreenUtil().setSp(28)),)
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