import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        print(val);
        var goodsDetails=Provide.value<GetGoodsDetails>(context).goodsInfo;
        if(goodsDetails != null){
          return Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            // padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _goodsImage(goodsDetails.goodInfo.image),
                _goodsPrice(goodsDetails.goodInfo.newPrice,goodsDetails.goodInfo.oldPrice),
                _goodsName(goodsDetails.goodInfo.name),
              ],
            ),
          );
        }else{
          return Center(child: Text('加载数据中'),);
        }
      },
    );
  }

  // 商品图片
  Widget _goodsImage(url){
    print(url);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Image.asset(
        url,
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(700)
      )
    );
  } 

  // 商品名称
  Widget _goodsName(name){
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: ScreenUtil().setWidth(1080),
      child: Text(
        name,
        maxLines: 2,
        style: TextStyle(fontSize: ScreenUtil().setSp(40),color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(newPrice, oldPrice){
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(1080),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '￥$newPrice',
              style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(40)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5,left:5),
            child: Text(
              '￥$oldPrice',
               style: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30),decoration: TextDecoration.lineThrough,),
            ),
          )
        ],
      )
    );
  }
}