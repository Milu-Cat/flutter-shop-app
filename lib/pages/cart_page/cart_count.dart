import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/cart_info_model.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartCount extends StatelessWidget {
  CartInfoModel cartItem;
  CartCount(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(cartItem),
          _addBtn(context),

        ],
      )
    );
  }

  // 减少按钮
  Widget _reduceBtn(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduceAction(cartItem,'reduce');
      },
      child: Container(
        child: cartItem.count>1? Text('—'):Text(' '),
      ),
    );
  }

  // 添加按钮
  Widget _addBtn(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduceAction(cartItem,'add');
      },
      child: Container(
        child: Text('+'),
      ),
    );
  }

  // 数量区域
  Widget _countArea(cartItem){
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(35),
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(3.0)
      ),
      // color: Colors.white,
      child: Text('${cartItem.count}', style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
    );
  }
}