import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../comments/bessel-curve.dart';

class AdminInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BesselCurve(),
        Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(1020),
            // height: ScreenUtil().setHeight(200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Container(
              margin: EdgeInsets.only(top:45),
              child: Column(
                children: <Widget>[
                  Text('橘九是橘色的'),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      child: Image.asset('image/merber/guanggao.png', width: ScreenUtil().setWidth(1020)),
                      borderRadius: BorderRadius.circular(6.0),
                    )
                  )
                ],
              )
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 5),
          child: Container(
            // width: ScreenUtil().setWidth(200),
            // height: ScreenUtil().setHeight(200),
            padding:EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45.0)
            ),
            child: ClipOval(
              child:Image.asset('image/admin_img.jpg', width: ScreenUtil().setWidth(150),)
            ),
          )
        )
      ],
    );
  }
}