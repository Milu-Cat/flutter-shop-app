import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler( // 跳到商品详情页的路由
  handlerFunc: (BuildContext context, Map<String, List<String>>params){ // 固定写法
    String goodId = params['id'].first;
    return DetailsPage(goodId);
  }
);