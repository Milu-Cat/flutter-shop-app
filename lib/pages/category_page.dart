import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/category.dart';
import '../router/application.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("data/category.json"),
         builder: (context, snapshot){
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            List<dynamic> leftList = (data['left'] as List).cast();
            List<dynamic> rightListInit = (data['man']['one'] as List).cast();
            List<dynamic> rightListInitTwo = (data['man']['two'] as List).cast();
            List<dynamic> rightListInitThree = (data['man']['three'] as List).cast();
            List<dynamic> rightListMan = (data['man']['one'] as List).cast();
            List<dynamic> rightListManTwo = (data['man']['two'] as List).cast();
            List<dynamic> rightListManThree = (data['man']['three'] as List).cast();
            List<dynamic> rightListWoman = (data['woman']['one'] as List).cast();
            List<dynamic> rightListWomanTwo = (data['woman']['two'] as List).cast();
            List<dynamic> rightListWomanThree = (data['woman']['three'] as List).cast();
            Provide.value<ChangeRightList>(context).changeList(rightListInit);
            Provide.value<ChangeRightList>(context).changeListTwo(rightListInitTwo);
            Provide.value<ChangeRightList>(context).changeListThree(rightListInitThree);
            Provide.value<ChangeRightList>(context).changeManList(rightListMan);
            Provide.value<ChangeRightList>(context).changeManTwoList(rightListManTwo);
            Provide.value<ChangeRightList>(context).changeManThreeList(rightListManThree);
            Provide.value<ChangeRightList>(context).changeWomanList(rightListWoman);
            Provide.value<ChangeRightList>(context).changeWomanListTwo(rightListWomanTwo);
            Provide.value<ChangeRightList>(context).changeWomanListThree(rightListWomanThree);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LeftCategoryList(leftList: leftList),
                RightList()
              ],
            );
          }else{
            return Center(
              child: Text('加载中........'),
            );
          }
         }
      )
    );
  }
}


// 左侧导航栏

class LeftCategoryList extends StatefulWidget {
  List<dynamic> leftList;
  // List<dynamic> rightList;
  LeftCategoryList({Key key,this.leftList}):super(key: key);

  @override
  _LeftCategoryListState createState() => _LeftCategoryListState();
}

class _LeftCategoryListState extends State<LeftCategoryList> {
  var listIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(230),
      height: ScreenUtil().setHeight(1794),
      color: Color.fromRGBO(247, 247, 247, 1),
      child: ListView.builder(
        itemCount: widget.leftList.length,
        itemBuilder: (BuildContext context, int index){
          return _leftInkWel(index);
        },
      )
    );
  }

  Widget _leftInkWel(int index){
    return InkWell(
      onTap: () async{
        setState(() {
          listIndex = index;
        });
        await Future.delayed(Duration(microseconds: 500), (){
          if(index == 0){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).man);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).manTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).manThree);
          }else if(index ==1){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).woman);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).womanTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).womanThree);
          }else if(index ==2){
           Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).man);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).manTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).manThree);
          }else if(index ==3){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).woman);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).womanTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).womanThree);
          }else if(index ==4){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).man);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).manTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).manThree);
          }else if(index ==5){
           Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).woman);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).womanTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).womanThree);
          }else if(index ==6){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).man);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).manTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).manThree);
          }else if(index ==7){
            Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).woman);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).womanTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).womanThree);
          }else if(index ==8){
             Provide.value<ChangeRightList>(context).changeList(Provide.value<ChangeRightList>(context).man);
            Provide.value<ChangeRightList>(context).changeListTwo(Provide.value<ChangeRightList>(context).manTwo);
            Provide.value<ChangeRightList>(context).changeListThree(Provide.value<ChangeRightList>(context).manThree);
          }
        });
        
      },
      child: Container(
        height: ScreenUtil().setHeight(110),
        color: listIndex == index? Colors.white: Color.fromRGBO(247, 247, 247, 1),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: ScreenUtil().setWidth(10), color: listIndex == index ? Colors.redAccent[700]: Color.fromRGBO(247, 247, 247, 1)
              )
            )
          ),
          child: Center(
            child: Text(widget.leftList[index]['mallCategoryName'], 
            style: listIndex == index ? TextStyle(fontSize: ScreenUtil().setSp(33), color: Colors.redAccent[700], fontWeight: FontWeight.w600) : TextStyle(fontSize: ScreenUtil().setSp(30))),
          ),
        )
      ),
    );
  }

}

// 右侧子分类列表
class RightList extends StatefulWidget {
  @override
  _RightListState createState() => _RightListState();
}

class _RightListState extends State<RightList> {
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(left: 10,top: 10.0),
    width: ScreenUtil().setWidth(850),
    color: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(  
            child: Text('新品上市',style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setWidth(30)),),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top:10),
            child: Wrap(
              spacing:25,
              children: tagItem(Provide.value<ChangeRightList>(context).valueOne, 'valueOne'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0 ),
            child: Text('潮流街区',style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setWidth(30)),),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top:10),
            child: Wrap(
              spacing:25,
              children: tagItem(Provide.value<ChangeRightList>(context).valueTwo,'valueTwo'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0 ),
            child: Text('热卖佳品',style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setWidth(30)),),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top:10),
            child: Wrap(
              spacing:25,
              children: tagItem(Provide.value<ChangeRightList>(context).valueThree, 'valueThree'),
            ),
          )
        ],
      )
    ),
    
  );
  }

  List<Widget> tagItem(data, String type) => List.generate(data.length, (index) {
        return Container(
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(230),
          margin: EdgeInsets.only(bottom: 5.0 ),
          child: InkWell(
            onTap: (){
              Application.router.navigateTo(context, "/details?id='hotOne'");  // 跳到商品详情页
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  Provide<ChangeRightList>(
                    builder: (BuildContext context, Widget child, rightList) {
                      if(type == 'valueOne'){
                        return Image.asset(rightList.valueOne[index]['image'],width: ScreenUtil().setWidth(180),height: ScreenUtil().setHeight(180));
                      }else if(type == 'valueTwo'){
                        return Image.asset(rightList.valueTwo[index]['image'],width: ScreenUtil().setWidth(180),height: ScreenUtil().setHeight(180));
                      }else if(type == 'valueThree'){
                        return Image.asset(rightList.valueThree[index]['image'],width: ScreenUtil().setWidth(180),height: ScreenUtil().setHeight(180));
                      }
                    },
                  ),
                  Provide<ChangeRightList>(
                    builder: (BuildContext context, Widget child, rightList) {
                      if(type == 'valueOne'){
                        return Text(rightList.valueOne[index]['title'], style: TextStyle(fontSize: 10),);
                      }else if(type == 'valueTwo'){
                        return Text(rightList.valueTwo[index]['title'], style: TextStyle(fontSize: 10),);
                      }else if(type == 'valueThree'){
                        return Text(rightList.valueThree[index]['title'], style: TextStyle(fontSize: 10),);
                      }
                    },
                  ),
                ],
              ),
            )  
           
          )
        );
      });

}