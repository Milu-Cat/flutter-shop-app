// 总体路由配置
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root ='/';
  static String detailsPage = '/details';
  static String detailsPageAnther = '/details-anther';
  static String goodsList = '/goods-list';
  static String search = '/search';
    static void configureRoutes(Router router){
      router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print('404，未找到页面');
        }
      );
      router.define(detailsPage, handler: detailsHandler);  // detailsHandler来着import './router_handler.dart';
      router.define(detailsPageAnther, handler: detailsAntherHandler);
      router.define(goodsList, handler: goodsListHandler);
      router.define(search, handler: searchHandler);
    }
}