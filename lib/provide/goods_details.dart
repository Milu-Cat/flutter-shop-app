import 'package:flutter/material.dart';
import '../model/goods_details.dart';
import 'dart:convert' show json;

class GetGoodsDetails with ChangeNotifier {
  GoodsDetailsModel goodsInfo;

  getGoodsDetails(String info){
    var responseData= json.decode(info.toString());
    goodsInfo=GoodsDetailsModel.fromJson(responseData);
    notifyListeners();
  }
}