import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
            List<dynamic> leftList = (data as List).cast();
            return Row(
              children: <Widget>[
                LeftCategoryList(leftList: leftList)
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
  LeftCategoryList({Key key,this.leftList}):super(key: key);

  @override
  _LeftCategoryListState createState() => _LeftCategoryListState();
}

class _LeftCategoryListState extends State<LeftCategoryList> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(1794),
      color: Colors.grey[200],
      // decoration: BoxDecoration(
      //   border: Border(
      //     right: BorderSide(
      //       width: 0.5,
      //       color: Colors.black12
      //     )
      //   )
      // ),
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
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(110),
        // color: Colors.red,
        // padding: EdgeInsets.only(left:10, top:20),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   border: Border(
        //     bottom: BorderSide(
        //       width: 1,
        //       color: Colors.black12
        //     )
        //   )
        // ),
        child: Center(
          child: Text(widget.leftList[index]['mallCategoryName'], style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
        )
      ),
    );
  }

}