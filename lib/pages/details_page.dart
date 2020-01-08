import 'package:flutter/material.dart';
// import 'dart:convert' show json;
// import '../model/goods_details.dart';
// import 'dart:ui';
import 'package:provide/provide.dart';
import '../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './details_pages/details_top_area.dart';
import './details_pages/details_tabbar.dart';
import './details_pages/details_bottom.dart';

class DetailsPage extends StatelessWidget {
    final String goodId;
    DetailsPage(this.goodId);
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
        future: DefaultAssetBundle.of(context).loadString("data/goodsDateils.json"),
         builder: (context, snapshot){
          if(snapshot.hasData){
            Provide.value<GetGoodsDetails>(context).getGoodsDetails(snapshot.data);
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    width: ScreenUtil().setWidth(1080),
                    child: Column(
                      children: <Widget>[
                        DetailsTopArea(goodId),
                        DetailsTabBar()
                      ],
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailsBottom(goodId),
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