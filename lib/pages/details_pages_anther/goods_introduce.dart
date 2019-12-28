import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        var goodsDetails=Provide.value<GetGoodsDetails>(context).goodsInfoAnther;
        if(goodsDetails != null){
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            // margin: EdgeInsets.only(top:20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                // _goodsIntroduceItem(),
                _goodsImage(goodsDetails['goodInfo']['introduceImage1']),
                _goodsImage(goodsDetails['goodInfo']['introduceImage2']),
                _goodsImage(goodsDetails['goodInfo']['introduceImage3']),
                _goodsImage(goodsDetails['goodInfo']['introduceImage4']),
                 _goodsImage(goodsDetails['goodInfo']['introduceImage5']),
                _goodsImage(goodsDetails['goodInfo']['introduceImage6']),
                _goodsImage(goodsDetails['goodInfo']['introduceImage7'])
              ],
            ),
          );
        }else{
          return Center(child: Text('加载数据中'),);
        }
      },
    );
  }
  
  // 商品介绍标题
  // Widget _goodsIntroduceItem(){
  //   return Container(
  //     // color: Colors.white,
  //     alignment: Alignment.centerLeft,
  //     padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
  //     // width: ScreenUtil().setWidth(1080),
  //     // height: ScreenUtil().setHeight(50),
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           width: 0.5,
  //           color: Colors.black12
  //         )
  //       )
  //     ),
  //     child: Text('商品介绍', style: TextStyle(color: Colors.redAccent[700])),
  //   );
  // }
  // 商品介绍图片
  Widget _goodsImage(url){
    return Container(
      child: Image.asset(
        url,
        width: ScreenUtil().setWidth(1060),
        // height: ScreenUtil().setHeight(700)
      )
    );
  }
}