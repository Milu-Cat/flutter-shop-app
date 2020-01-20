import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:convert' show json;
import '../pages/search_page/hot_goods.dart';
import './search_page/hot_search.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[TextFieldSearch()],
      ),
      body:SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                RecentSearch(),
                HotSearch(),
                HotRecommended()
              ],
            ),
          ),
        )
    );
  }
}

// appbar 搜索框
class TextFieldSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(950),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(75),
            maxWidth: ScreenUtil().setWidth(850)),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
            hintText: '华为mate20 pro',
            hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(35), locale: Locale('en', 'US')),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: _textFieldChanged,
        ),
      ),
    );
  }

  void _textFieldChanged(String val) {
    print(val);
  }
}

// 最近搜索部分
class RecentSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
        color: Colors.white,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '最近搜索',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(38)),
              ),
              Icon(
                Icons.delete,
                color: Colors.black12,
              )
            ],
          ),
          Container(
            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: recommedList.length,
            //   itemBuilder: (context, index) {
            //     return _itemGoods(context, index);
            //   },
            // ),
            child: Text('~暂无搜索记录',
                style: TextStyle(
                    color: Colors.black26, fontSize: ScreenUtil().setSp(38))),
          ),
        ]));
  }
}


// 热门推荐部分
class HotRecommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '热门推荐',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(38)),
            ),
          ),
          HotGoodsList()
        ],
      ),
    );
  }
}