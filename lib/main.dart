import 'package:flutter/material.dart';
import 'pages/index_page.dart';
// http://v.jspang.com:8088/baixing/

void main()=>runApp(MyApp());

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