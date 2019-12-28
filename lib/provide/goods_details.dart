import 'package:flutter/material.dart';
// import '../model/goods_details.dart';
import 'dart:convert' show json;

class GetGoodsDetails with ChangeNotifier {
  // GoodsDetailsModel goodsInfo;
  Map<String, dynamic> goodsInfo;
  Map<String, dynamic> goodsInfoAnther;
  bool isLeft= true;
  bool isRight= false;

  getGoodsDetails(String info){
    var responseData= json.decode(info.toString());
    // goodsInfo=GoodsDetailsModel.fromJson(responseData);
    goodsInfo=responseData;
    notifyListeners();
  }

  getGoodsDetailsAnther(String info){
    var responseData= json.decode(info.toString());
    goodsInfoAnther= responseData;
    notifyListeners();
  }

  // 切换tab的方法
  changTab(String type){
    if(type == 'left'){
      isLeft = true;
      isRight = false;
    }else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}