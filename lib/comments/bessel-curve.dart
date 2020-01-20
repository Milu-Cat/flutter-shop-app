// 贝塞尔曲线
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class BesselCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BesselCurvePath(), // BesselCurvePath是自定义控件，用来返回一个完整的路径
      child: Container(
        color: Colors.redAccent[700],
        height: 100.0,
      ),
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