import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import './goods_introduce.dart';
import './goods_comments.dart';

class TabWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        var isLeft = Provide.value<GetGoodsDetails>(context).isLeft;
        // var isRight = Provide.value<GetGoodsDetails>(context).isRight;
        if(isLeft){
          return GoodsIntroduce();
        }else{
          return GoodsComments();
        }
      });
  }
}