import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        List<dynamic> goodsDetails=(Provide.value<GetGoodsDetails>(context).goodsInfo['goodInfo']['comment'] as List).cast();
        if(goodsDetails != null){
          return Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: goodsDetails.asMap().keys.map((index){ // 这里加上.asMap().keys，就不会有index不是int的报错
                    return _commentItem(context, index);
                  }).toList()
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  alignment: Alignment.center,
                  child: Text('共用9位用户给出了好评！', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black38)),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                ),
              ],
            )
          );
        }else{
          return Center(child: Text('加载数据中'),);
        }
      });
  }

  // 评论内容组件
  Widget _commentItem(BuildContext context, index){
    final comment = Provide.value<GetGoodsDetails>(context).goodsInfoAnther['goodInfo']['comment'];
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipOval(
                  child:Image.asset(comment[index]['image'], width:ScreenUtil().setWidth(95)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(comment[index]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('翡冷翠，8GB+256GB', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black38),)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text(comment[index]['content']),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(comment[index]['time'], style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black38)),
          )
        ],
      ),
    );
  }
}