import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
         _adminInfo(),
         _navigor(),
         _myOrder(),
         _myTool()
      ],
     ) ,
   );
  }
  // 个人信息部分
  Widget _adminInfo(){
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

  // 导航栏
  Widget _navigor(){
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

  // 我的订单区域
  Widget _myOrder(){
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

    // 我的工具
  Widget _myTool(){
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