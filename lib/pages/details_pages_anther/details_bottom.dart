import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class DetailsBottomAnther  extends StatelessWidget {
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
            onTap: _launchUrl,
            child: Container(
              width: ScreenUtil().setWidth(200),
              alignment: Alignment.center,
              child: Icon(
                Icons.phone,
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
            onTap: () async{
              await Provide.value<CartProvide>(context).save('two','OnitsukaTiger鬼冢虎2018中性MEXICO 66MEXICO 1183A212-008 1183A212-107 37',1,589.0,'image/goods_details/another/img1.jpg');
            },
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
              width: ScreenUtil().setWidth(340),
              height: ScreenUtil().setHeight(120),
              // color: Colors.deepOrangeAccent[400],
              child: Text('加入购物车', style: TextStyle(color: Colors.redAccent[700]),),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(340),
              height: ScreenUtil().setHeight(120),
              color: Colors.redAccent[700],
              child: Text('立即购买',  style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  void _launchUrl() async{
    String url = 'tel:15510119951';
    if(await canLaunch(url)){
      await launch(url);
      print('正在打电话');
    }else {
      throw 'url不能进行访问！';
    }
  }
}