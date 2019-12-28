import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './tab_web.dart';

class DetailsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GetGoodsDetails>(
      builder: (context, child, val){
        var isLeft = Provide.value<GetGoodsDetails>(context).isLeft;
        var isRight = Provide.value<GetGoodsDetails>(context).isRight;

        return Container(
          // color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _tab(context, isLeft, '商品介绍'),
                  _tab(context, isRight, '评论')
                ],
              ),
              TabWeb()
            ],
          )
        );
      },
    );
  }

  // 
  Widget _tab(BuildContext context, bool tabActive, String tabTitle){
    return InkWell(
      onTap: (){
        if(tabTitle == '商品介绍'){
          Provide.value<GetGoodsDetails>(context).changTab('left');
        }else{
          Provide.value<GetGoodsDetails>(context).changTab('right');
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(540),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: tabActive? Colors.redAccent[700]: Colors.white
            )
          )
        ),
        child: Text(tabTitle, style: TextStyle(color: tabActive? Colors.redAccent[700]: Colors.black),),
      ),
    );
  }
}