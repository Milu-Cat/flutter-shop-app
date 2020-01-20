import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../router/application.dart';

class AppBarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.only(top: 10, bottom: 10),
      // height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setWidth(1080),
      color: Colors.redAccent[700],
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/search");  // 跳到搜索页面
        },
        child: Container(
          width: ScreenUtil().setWidth(950),
          height: ScreenUtil().setHeight(65),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              Text('华为mate 20 pro', style: TextStyle(color: Colors.black38),)
            ],
          ),
        ),
      ),
    );
  }
}