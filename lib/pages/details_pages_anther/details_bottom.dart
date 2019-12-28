import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottom  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      width: ScreenUtil().setHeight(1794),
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              width: ScreenUtil().setWidth(200),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 26,
                color: Colors.redAccent[700],
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 0.5,
                    color: Colors.black12
                  )
                )
              ),
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(440),
              height: ScreenUtil().setHeight(120),
              // color: Colors.deepOrangeAccent[400],
              child: Text('加入购物车', style: TextStyle(color: Colors.redAccent[700]),),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(440),
              height: ScreenUtil().setHeight(120),
              color: Colors.redAccent[700],
              child: Text('立即购买',  style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}