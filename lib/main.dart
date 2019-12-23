import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';  //把状态管理引入到main.dart中
import './provide/category.dart';

void main(){
  var category =ChangeRightList();
  var providers  =Providers();
  providers
    ..provide(Provider<ChangeRightList>.value(category));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink,splashColor: Colors.transparent),
        home: IndexPage()
      ),
    );
  }
}