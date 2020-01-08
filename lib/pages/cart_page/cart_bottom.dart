import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(1080),
      child: Row(
        children: <Widget>[
          _selectAllBt(context),
          _allPrice(context),
          _goBtn(context)
        ],
      )
    );
  }

  // 全选按钮
  Widget _selectAllBt(context){
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.redAccent[700],
            onChanged: (bool val){
              Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选',style: TextStyle(fontSize: ScreenUtil().setSp(32)),)
        ],
      ),
    );
  } 

  // 合计区域
  Widget _allPrice(context){
    double allPrice = Provide.value<CartProvide>(context).allPrice;
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text('合计', style: TextStyle(fontSize: ScreenUtil().setSp(38))),
              ),
              Container(
                child: Text('￥$allPrice', style: TextStyle(fontSize: ScreenUtil().setSp(37), color: Colors.redAccent[700])),
              )
            ],
          ),
          Container(
            child: Text('满95元免配送费，预购免配送费', style: TextStyle(fontSize: ScreenUtil().setSp(25), color: Colors.black26)),
          )
        ],
      )
    );
  }

  // 结算按钮
  Widget _goBtn(context ){
    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      margin: EdgeInsets.only(left:100),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 10.0, left: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.redAccent[700],
            borderRadius: BorderRadius.circular(17.0)
          ),
          child: Text('去结算($allGoodsCount )', style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.white)),
        ),
      ),
    );
  }
}