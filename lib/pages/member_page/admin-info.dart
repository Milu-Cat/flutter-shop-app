import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: BesselCurvePath(), // BesselCurvePath是自定义控件，用来返回一个完整的路径
          child: Container(
            color: Colors.redAccent[700],
            height: 100.0,
          ),
        ),
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

class BesselCurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size){  // 这里的size接收的是上面Container的容器尺寸
    var path = Path();   // path需要设置四个路径点，两个控制点（firstControlPoint，firstEndPoint）
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint  = Offset(size.width, size.height-50);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}