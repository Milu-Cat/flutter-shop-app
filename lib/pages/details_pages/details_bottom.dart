import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provide/cart.dart';
import 'package:provide/provide.dart';
import '../../provide/currentIndex.dart';

class DetailsBottom  extends StatelessWidget {
  String goodId;
  DetailsBottom(this.goodId);
  
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
          // 拨打电话
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
          // 去购物车
          Stack(
             children: <Widget>[
               InkWell(
                  onTap: (){
                      Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                      if(goodId == 'two'){
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }else{
                        Navigator.pop(context);
                      }
                  },
                  child: Container(
                      width: ScreenUtil().setWidth(200) ,
                      alignment: Alignment.center,
                      child:Icon(
                            Icons.shopping_cart,
                            size: 26,
                            color: Colors.redAccent[700],
                          ), 
                    ) ,
                ),
                // 在详情页显示购物车商品数量
                Provide<CartProvide>(
                  builder: (context,child,val){
                    // Provide.value<CartProvide>(context).getCartGoodsCount();
                    int  goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                    return  Positioned(
                        top:0,
                        right: 10,
                        child: Container(
                          padding:EdgeInsets.fromLTRB(6, 3, 6, 3),
                          decoration: BoxDecoration(
                            color:Colors.redAccent[700],
                            border:Border.all(width: 2,color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: Text(
                            '$goodsCount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(22)
                            ),
                          ),
                        ),
                      ) ;
                  },
                )

             ],
           ),
          // 加入购物车
          InkWell(
            onTap: () async{
              await Provide.value<CartProvide>(context).save('one','华为 HUAWEI Mate 30 Pro 5G 麒麟990 OLED环幕屏双4000万徕卡电影四摄8GB+256GB亮黑色5G全网通游戏手机',1,6599.0,'image/goods_details/goods_details1.jpg');
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
          // 立即购买
          InkWell(
            onTap: () async{
              // await Provide.value<CartProvide>(context).removeAll();
            },
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