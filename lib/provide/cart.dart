import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_info_model.dart';

class CartProvide with ChangeNotifier{
  List<CartInfoModel> cartList = [];
  String cartString="[]";
  double allPrice = 0;  // 商品总价格
  int allGoodsCount = 0;  // 商品总数量
  bool isAllCheck= true; //是否全选

  // 添加到购物车
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    // print(cartString);
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    var isHave = false; // 默认没有该商品
    int ival = 0;  // 用于下面的循环
    allPrice=0; 
    allGoodsCount=0; 
    // print(tempList);
    // print(tempList.length);
    if(tempList.length != 0){
      tempList.forEach((item){
        if(item['goodsId'] == goodsId){
          tempList[ival]['count'] = item['count'] +1;
          cartList[ival].count ++;
          isHave = true;
        }
        // if(item['isCheck']){  //可以决定详情页实现的商品数量，是被选中的，还是所有的
         allPrice+= (cartList[ival].price* cartList[ival].count);
         allGoodsCount+= cartList[ival].count;
        // }
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
        'images':images,
        'isCheck': true
      };
      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
      allPrice+= (count * price);
      allGoodsCount+=count;
    }
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //进行持久化
    // print(cartString);
    notifyListeners();
  }

  // 清除购物车或者某个商品
  removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear(); //全部清空
    prefs.remove('cartInfo');//删除key键
    cartList = [];
  }

  // 删除购物车中某个商品
  deleteOneGoods(String goodsId) async{
    SharedPreferences prefs = await SharedPreferences .getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
    int tempIndex  = 0;
    int delIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == goodsId){
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
    notifyListeners();
  }

  // 修改购物车中选中的状态
  changeCheckState(CartInfoModel cartItem) async{
    SharedPreferences prefs = await SharedPreferences .getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
    int tempIndex  = 0; // 循环所用索引
    int changeIndex = 0; // 需要修改商品的索引
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartItem.toJson(); //把对象变成Map值
    cartString = json.encode(tempList).toString(); //变成字符串
    prefs.setString('cartInfo', cartString);//进行持久化
    await getCartInfo();
    notifyListeners();
  }

  //点击全选按钮操作
  changeAllCheckBtnState(bool isCheck) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo'); 
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast(); 
    List<Map> newList=[]; //新建一个List，用于组成新的持久化数据。
    for(var item in tempList ){
      var newItem = item; //复制新的变量，因为Dart不让循环时修改原值
      newItem['isCheck']=isCheck; //改变选中状态
      newList.add(newItem);
    } 
     cartString= json.encode(newList).toString();//形成字符串
     prefs.setString('cartInfo', cartString);//进行持久化
     await getCartInfo();
  }

  // 购物车加减方法
  addOrReduceAction(var cartItem, String todo )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo'); 
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
    int tempIndex =0;
    int changeIndex=0;
    tempList.forEach((item){
         if(item['goodsId']==cartItem.goodsId){
          changeIndex=tempIndex; 
         }
         tempIndex++;
     });
     if(todo=='add'){
       cartItem.count++;
     }else if(cartItem.count>1){
       cartItem.count--;
     }
     tempList[changeIndex]=cartItem.toJson();
     cartString= json.encode(tempList).toString();
     prefs.setString('cartInfo', cartString);//
     await getCartInfo();
  }

  // 得到购物车中商品数量
  // getCartGoodsCount() async {
  //   SharedPreferences prefs = await SharedPreferences .getInstance();
  //   // 获取购物车的商品，这时候是一个字符串
  //   cartString = prefs.getString('cartInfo');
  //   // 把cartList初始化，防止数据混乱
  //   cartList = [];
  //   // 判断得到的字符串是否有值，如果不判断会报错
  //   if(cartString == null){
  //     cartList = [];
  //   }else{
  //     List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
  //     allGoodsCount=0;
  //     tempList.forEach((item){
  //       allGoodsCount+=item['count'];
  //     });
  //   }
  //   notifyListeners();
  // }

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
      allPrice=0;
      allGoodsCount=0;
      isAllCheck=true;
      tempList.forEach((item){
        if(item['isCheck']){
          allPrice+=(item['count']*item['price']);
          allGoodsCount+=item['count'];
        }else{
          isAllCheck=false;
        }
        cartList.add(new CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }
}