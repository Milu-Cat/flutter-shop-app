import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';
import '../pages/details_anther_page.dart';
import '../pages/goods_list.dart';

Handler detailsHandler = Handler( // 跳到商品详情页的路由
  handlerFunc: (BuildContext context, Map<String, List<String>>params){ // 固定写法
    String goodId = params['id'].first;
    return DetailsPage(goodId);
  }
);

Handler detailsAntherHandler = Handler( // 跳到商品详情页的路由
  handlerFunc: (BuildContext context, Map<String, List<String>>params){ // 固定写法
    String goodId = params['id'].first;
    return DetailsPageAnther(goodId);
  }
);

Handler goodsListHandler = Handler( // 跳到商品列表页的路由
  handlerFunc: (BuildContext context, Map<String, List<String>>params){ // 固定写法
    String goodListId = params['id'].first;
    return GoodsList(goodListId);
  }
);