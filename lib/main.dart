import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';  //把状态管理引入到main.dart中
import './provide/category.dart';
import './provide/goods_details.dart';
import './provide/cart.dart';
import 'package:fluro/fluro.dart';
import './router/application.dart';
import './router/routes.dart';

void main(){
  var category =ChangeRightList();
  var goodsDetails =GetGoodsDetails();
  var cartProvide =CartProvide();
  var providers  =Providers();

  providers
    ..provide(Provider<ChangeRightList>.value(category))
    ..provide(Provider<GetGoodsDetails>.value(goodsDetails))
    ..provide(Provider<CartProvide>.value(cartProvide));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化路由--start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router= router;
    // 初始化路由--end


    return Container(
      child: MaterialApp(
        title: 'Flutter Shop',
        // 引入路由静态文件 --start
        onGenerateRoute: Application.router.generator,
        // 引入路由静态文件 --end
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.redAccent[700],splashColor: Colors.transparent),
        home: IndexPage()
      ),
    );
  }
}