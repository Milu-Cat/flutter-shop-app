import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import '../../router/application.dart';

class HotGoodsList extends StatefulWidget {
  @override
  _HotGoodsListState createState() => _HotGoodsListState();
}

class _HotGoodsListState extends State<HotGoodsList> {
  int page = 1;
  List<Map> hotGoddsList = [
    {
      "image": "image/hotGoods1.jpg",
      "title": "露华浓",
      "oldCost": "￥99",
      "cost": "￥59"
    },
    {
      "image": "image/hotGoods2.jpg",
      "title": "植美村",
      "oldCost": "￥256",
      "cost": "￥199"
    },
    {
      "image": "image/hotGoods3.jpg",
      "title": "迪奥",
      "oldCost": "￥899",
      "cost": "￥759"
    },
    {
      "image": "image/hotGoods4.jpg",
      "title": "周大福时尚简约纯银珍珠吊坠",
      "oldCost": "￥570",
      "cost": "￥499"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HotGoods(
          hotGoddsList: hotGoddsList,
        )
      ],
    );
  }
}

class HotGoods extends StatelessWidget {
  // int page = 1;
  List<Map> hotGoddsList;
  HotGoods({this.hotGoddsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _hotContent(context),
    );
  }

  //火爆专区内容
  Widget _hotContent(BuildContext context) {
    if (hotGoddsList.length != 0) {
      List<Widget> listWidget = hotGoddsList.map((val) {
        return InkWell(
          onTap: () {
            Application.router
                .navigateTo(context, "/details?id=two"); // 跳到商品详情页
          },
          child: Container(
            width: ScreenUtil().setWidth(500),
            height: ScreenUtil().setHeight(760),
            decoration: BoxDecoration(
              color: Colors.white,
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //设置四周边框
              border: Border.all(width: 0.5, color: Colors.black12),
            ),
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: ScreenUtil().setWidth(500),
                    height: ScreenUtil().setHeight(600),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset(
                        val['image'],
                        fit: BoxFit.cover,
                      ),
                    )),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Text('${val['cost']}'),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${val['oldCost']}',
                        style: TextStyle(
                            color: Colors.black12,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 11.0),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '${val['title']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 10,
        children: listWidget,
      );
    } else {
      return Text('暂无商品');
    }
  }
}
