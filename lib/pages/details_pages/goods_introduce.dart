import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        print(val);
        var goodsDetails=Provide.value<GetGoodsDetails>(context).goodsInfo;
        if(goodsDetails != null){
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(top:20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsIntroduceItem(),
                _goodsImage(goodsDetails.goodInfo.introduceImage1),
                _goodsImage(goodsDetails.goodInfo.introduceImage2),
                _goodsImage(goodsDetails.goodInfo.introduceImage3),
                _goodsImage(goodsDetails.goodInfo.introduceImage4),
                _goodsImage(goodsDetails.goodInfo.introduceImage5),
                _goodsImage(goodsDetails.goodInfo.introduceImage6),
                _goodsImage(goodsDetails.goodInfo.introduceImage7),
                _goodsImage(goodsDetails.goodInfo.introduceImage8),
                _goodsImage(goodsDetails.goodInfo.introduceImage9),
                _goodsImage(goodsDetails.goodInfo.introduceImage10),
                _goodsImage(goodsDetails.goodInfo.introduceImage11),
                _goodsImage(goodsDetails.goodInfo.introduceImage12),
                _goodsImage(goodsDetails.goodInfo.introduceImage13),
                _goodsImage(goodsDetails.goodInfo.introduceImage14),
                _goodsImage(goodsDetails.goodInfo.introduceImage15),
                _goodsImage(goodsDetails.goodInfo.introduceImage16),
                _goodsImage(goodsDetails.goodInfo.introduceImage17),
                _goodsImage(goodsDetails.goodInfo.introduceImage18),
                _goodsImage(goodsDetails.goodInfo.introduceImage19),
                _goodsImage(goodsDetails.goodInfo.introduceImage20),
                _goodsImage(goodsDetails.goodInfo.introduceImage21),
                _goodsImage(goodsDetails.goodInfo.introduceImage22),
                _goodsImage(goodsDetails.goodInfo.introduceImage23),
                _goodsImage(goodsDetails.goodInfo.introduceImage24),
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
  Widget _goodsIntroduceItem(){
    return Container(
      // color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
      // width: ScreenUtil().setWidth(1080),
      // height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Text('商品介绍', style: TextStyle(color: Colors.pink)),
    );
  }
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