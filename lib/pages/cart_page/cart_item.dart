import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/cart_info_model.dart';
import './cart_count.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import '../../router/application.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel item;
  CartItem(this.item);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.only(top:15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBt(context, item),
          _cartImage(context, item),
          Container(
            child: Column(
              children: <Widget>[
                _cartGoodsName(context, item),
                _cartPrice(context, item)
              ],
            ),
          )
        ],
      ),
    );
  }

  // 多选按钮
  Widget _cartCheckBt(context, item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.redAccent[700],
        onChanged: (bool val){
          item.isCheck = val;
          Provide.value<CartProvide>(context).changeCheckState(item);
        },
      ),
    );
  }

  // 商品图片
  Widget _cartImage(context, item){
    return InkWell(
      onTap: (){
        if(item.goodsId == 'one'){
          Application.router.navigateTo(context, "/details?id=one"); 
        }else{
          Application.router.navigateTo(context, "/details-anther?id=two");
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(200.0),
        child: Image.asset(item.images, width: ScreenUtil().setWidth(300), height: ScreenUtil().setHeight(300),),
      ),
    );
  }
  
  // 商品名称
  Widget _cartGoodsName(context, item){
    return Container(
      // color: Colors.green,
      padding: EdgeInsets.only(left: 20),
      width: ScreenUtil().setWidth(750.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              if(item.goodsId == 'one'){
                Application.router.navigateTo(context, "/details?id=one"); 
              }else{
                Application.router.navigateTo(context, "/details-anther?id=two");
              }
            },
            child: Text(item.goodsName, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
          ),
          CartCount(item)
        ],
      )
    );
  }

  // 商品价格
  Widget _cartPrice(context, item){
    return Container(
      // color: Colors.pink,
      padding: EdgeInsets.only(left: 20, top: 10, right: 10),
      width: ScreenUtil().setWidth(750.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('￥${item.price}', style: TextStyle(color: Colors.redAccent[700], fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.w700 ),),
          Container(
            child: InkWell(
              onTap: (){
                Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete,
                color: Colors.black12,
                size: 22,
              ),
            ),
          )
        ],
      )
    );
  }
}