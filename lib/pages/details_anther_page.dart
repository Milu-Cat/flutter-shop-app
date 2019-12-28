import 'package:flutter/material.dart';
// import 'dart:convert' show json;
// import '../model/goods_details.dart';
// import 'dart:ui';
import 'package:provide/provide.dart';
import '../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './details_pages_anther/details_top_area.dart';
import './details_pages_anther/details_tabbar.dart';
import './details_pages_anther/details_bottom.dart';

class DetailsPageAnther extends StatelessWidget {
  final String goodsId;
  DetailsPageAnther(this.goodsId);
  @override
  Widget build(BuildContext context) {
          return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("data/goodsDateilsOther.json"),
         builder: (context, snapshot){
          if(snapshot.hasData){
            Provide.value<GetGoodsDetails>(context).getGoodsDetailsAnther(snapshot.data);
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    width: ScreenUtil().setWidth(1080),
                    child: Column(
                      children: <Widget>[
                        DetailsTopArea(goodsId),
                        DetailsTabBar()
                      ],
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailsBottom(),
                )
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