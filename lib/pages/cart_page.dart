import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList =[];
  @override
  Widget build(BuildContext context) {
    _show(); //每次进入前进行显示
    return Container(
      child:Column(
        children: <Widget>[
          Container(
            height: 500.0,
            child: ListView.builder(
                itemCount:testList.length ,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(testList[index]),
                  );
                },
              ) ,
          ),

          RaisedButton(
            onPressed: (){_add();},
            child: Text('增加'),
          ),
          RaisedButton(
            onPressed: (){_clear();},
            child: Text('清空'),
          ),
        ],
      )
    );
  }

  // 增添方法
  void _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //prefs是自定义的，其他是固定写法
    String temp = '服务服务费';
    testList.add(temp);
    prefs.setStringList('testInfo', testList);
    _show();
  }

  // 显示方法
  void _show() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getStringList('testInfo')!=null){
        testList = prefs.getStringList('testInfo');
      }
    });
  }

  // 删除的方法
  void _clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear(); //全部清空
    prefs.remove('testInfo');//删除key键
    setState(() {
      testList = [];
    });
  }
}