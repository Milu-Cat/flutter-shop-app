import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_info_model.dart';

class CartProvide with ChangeNotifier{
  List<CartInfoModel> cartList = [];
   String cartString="[]";
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    // print(cartString);
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    var isHave = false; // 默认没有该商品
    int ival = 0;  // 用于下面的循环
    print(tempList);
    print(tempList.length);
    if(tempList.length != 0){
      tempList.forEach((item){
        if(item['goodsId'] == goodsId){
          tempList[ival]['count'] = item['count'] +1;
          cartList[ival].count ++;
          isHave = true;
        }
        ival++;
      });
    }
    
    // 如果没有则加入到购物车
    if(!isHave){
      Map<String, dynamic> newGoods = {
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images
      };
      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
    }
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //进行持久化
    print(cartString);
    notifyListeners();
  }

  // 清除购物车或者某个商品
  removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear(); //全部清空
    prefs.remove('cartInfo');//删除key键
    cartList = [];
  }

  // 得到购物车中的商品
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences .getInstance();
    // 获取购物车的商品，这时候是一个字符串
    cartString = prefs.getString('cartInfo');
    // 把cartList初始化，防止数据混乱
    cartList = [];
    // 判断得到的字符串是否有值，如果不判断会报错
    if(cartString == null){
      cartList = [];
    }else{
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item){
        cartList.add(new CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }
}