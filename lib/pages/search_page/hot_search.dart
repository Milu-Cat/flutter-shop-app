import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 最近搜索部分
class HotSearch extends StatelessWidget {
  // List<Map> hotSearch = (json.decode([{"name": "鬼冢虎"}].toString()) as List).cast();
  //  HotSearch(this.hotSearch);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '热门搜索',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(38)),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(50),
            padding: EdgeInsets.only(left: 10, right: 10),
            // color: Colors.green,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // itemCount: hotSearch.length,
              // itemBuilder: (context, index) {
              //   return _itemHotSearch(context, index);
              // },
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('鬼冢虎'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('华为meta'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('tiger鞋'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('宜家家居'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('米兰'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 3),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('iPad'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('格力'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('电压力锅'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget _itemHotSearch(context, index){
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.black26,
  //       borderRadius: BorderRadius.circular(30)
  //     ),
  //     child: Text('SD'),
  //   );
  // }
}