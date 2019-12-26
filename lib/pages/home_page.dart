import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 需要下载flutter_swiper最新版
// import '../service/service_method.dart';  // 使用http时
import 'dart:convert' show json; // 解析json的依赖
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import 'package:flutter_easyrefresh/easy_refresh.dart'; // 上拉获取新的数据插件
import '../router/application.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {  // 混入AutomaticKeepAliveClientMixin是为了保持页面状态
  @override
  bool get wantKeepAlive =>true;  // 混入AutomaticKeepAliveClientMixin必须写上这行代码
  // @override
  // void initState() {
  //   super.initState();
  //    print('111111111111111111111111111');
  // }

  int page =1;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("data/homePage.json"),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> navigatorList = (data['data']['topNavigator'] as List).cast();
            String adPicture = data['data']['adPicture']['image'];
            String adTell = data['data']['adTell']['image'];
            String leaderPhone = data['data']['adTell']['leaderPhone'];
            List<Map> recommendList = (data['data']['recommend'] as List).cast();
            String floorImg = data['data']['floorTitle'];
            List<Map> floorContentList = (data['data']['floor'] as List).cast();
            return EasyRefresh(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiper),
                    TopNavigator(navigatorList: navigatorList),
                    AdBanner(adPicture:adPicture),
                    Recommed(recommedList: recommendList,),
                    AdTell(adTell: adTell, leaderPhone: leaderPhone),
                    FloorTitle(floorImg: floorImg),
                    FloorContent(floorContentList: floorContentList,),
                    HotGoods(hotGoddsList: hotGoddsList,)
                  ],
                )
              ), 
              // onRefresh:()async {
              //   // return Text('加载中...');
              // },
              onLoad: () async {
                await Future.delayed(Duration(seconds: 1), (){
                  setState(() {
                    if(page == 1){
                      hotGoddsList.add(data['data']['hotGoods']['page1'][0]);
                      hotGoddsList.add(data['data']['hotGoods']['page1'][1]);
                      hotGoddsList.add(data['data']['hotGoods']['page1'][2]);
                      hotGoddsList.add(data['data']['hotGoods']['page1'][3]);
                      page ++;
                    }else if(page == 2){
                      hotGoddsList.add(data['data']['hotGoods']['page2'][0]);
                      hotGoddsList.add(data['data']['hotGoods']['page2'][1]);
                      hotGoddsList.add(data['data']['hotGoods']['page2'][2]);
                      hotGoddsList.add(data['data']['hotGoods']['page2'][3]);
                      page ++;
                    }else if(page == 3){
                      hotGoddsList.add(data['data']['hotGoods']['page3'][0]);
                      hotGoddsList.add(data['data']['hotGoods']['page3'][1]);
                      hotGoddsList.add(data['data']['hotGoods']['page3'][2]);
                      hotGoddsList.add(data['data']['hotGoods']['page3'][3]);
                      page ++;
                    }
                  });
                });
              },
            );
          }else{
            return Center(
              child: Text('加载中........'),
            );
          }
        },
      )
    );
  }


}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swiperDataList;
  SwiperDiy({this.swiperDataList});


  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(370),
      width: ScreenUtil().setWidth(1794.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              Application.router.navigateTo(context, "/details?id='hotOne'");  // 跳到商品详情页
            },
            child: Image.asset("${swiperDataList[index]['image']}", fit: BoxFit.fill),
          );
          
        },
        itemCount: 3,
        pagination: SwiperPagination.fraction,  //是否显示指示点
        autoplay: true, //自动播放
      ),
    );
  }
}


// 轮播下面的导航块
class TopNavigator extends StatelessWidget {

  final List navigatorList;
  TopNavigator({this.navigatorList});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      height: ScreenUtil().setHeight(390),
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: GridView.count(
        crossAxisCount: 5,
        // padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          return _gridViewItemUi(context, item);
        }).toList()
      ),
    );
  }

    Widget _gridViewItemUi(BuildContext context, item){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/goods-list?id='hotOne'"); // 跳到商品列表页
      },
      child: Column(children: <Widget>[
        Container(
          // color: Colors.green,
          alignment: Alignment.center,
          child: ClipOval(
            child:Image.asset(item['image'], width:ScreenUtil().setWidth(95)),
          ),
        ),
        Text(item['topTitle'],style: TextStyle(fontSize: 11.0),)
      ],),
    );
  }
}


// 广告位
class AdBanner extends StatelessWidget {

  final String adPicture;
  AdBanner({this.adPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260.0),
      width: ScreenUtil().setWidth(1080.0) ,
      // color: Colors.green,
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/goods-list?id='hotOne'"); // 跳到商品列表页
        },
        child: Image.asset(adPicture, fit: BoxFit.cover),
      )
      
    );
  }
}


// 一键打店长电话
class AdTell extends StatelessWidget {

  final String adTell;  // 电话图片
  final String leaderPhone; // 店长电话
  AdTell({this.adTell, this.leaderPhone});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      height: ScreenUtil().setHeight(240.0),
      width: ScreenUtil().setWidth(1080.0),
      // color: Colors.green,
      child: InkWell(
        onTap: _launchUrl,
        child: Image.asset(adTell), 
      )
    );
  }

  void _launchUrl() async{
    String url = 'tel:' + leaderPhone;
    if(await canLaunch(url)){
      await launch(url);
      print('正在打电话');
    }else {
      throw 'url不能进行访问！';
    }
  }
}



// 商品推荐
class Recommed extends StatelessWidget {
  
  final List recommedList;
  Recommed({this.recommedList});

  // 标题方法
  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink),),
    );
  }

  // 推荐商品item方法
  Widget _itemGoods(context,index){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/details?id='hotOne'");  // 跳到商品详情页
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.asset(recommedList[index]['image'], width: ScreenUtil().setWidth(200),height: ScreenUtil().setHeight(200),),
            Text('￥${recommedList[index]['cost']}'),
            Text('￥${recommedList[index]['oldCost']}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 12.0,
            ))
          ],
        ),
      ),
    );
  }

  // 横向列表方法
  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(350),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommedList.length,
        itemBuilder: (context, index){
          return _itemGoods(context, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      height: ScreenUtil().setHeight(425),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}


// 楼层标题
class FloorTitle extends StatelessWidget {

  final String floorImg;
  FloorTitle({this.floorImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      margin: EdgeInsets.only(top: 10.0),
      // padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/goods-list?id='hotOne'"); // 跳到商品列表页
        },
        child: Image.asset(floorImg),
      )
    );
  }
}

// 楼层内容
class FloorContent extends StatelessWidget {
  final List floorContentList;
  FloorContent({this.floorContentList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  Widget _firstRow(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorContentList[0], 460),
        Column(
          children: <Widget>[
            _goodsItem(context,floorContentList[1], 230),
            _goodsItem(context,floorContentList[2], 230),
          ],
        )
      ],
    );
  }
  Widget _otherGoods(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorContentList[3],220),
        _goodsItem(context,floorContentList[4], 220),
      ],
    );
  }
  Widget _goodsItem(context, Map goods, int height){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
      ),
      width: ScreenUtil().setWidth(540),
      height: ScreenUtil().setHeight(height),
      child: InkWell(
        onTap: (){  
          Application.router.navigateTo(context, "/goods-list?id='hotOne'"); // 跳到商品列表页
        },
        child: Image.asset(goods['image'], fit: BoxFit.cover),
      ),
    );
  }
}


// 火爆专区
class HotGoods extends StatelessWidget {
  // int page = 1;
  List<Map> hotGoddsList;
  HotGoods({this.hotGoddsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _hotGoods(context),
    );
  }

// 火爆标题
  Widget _hotTitle(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        )
      ),
      child: Text('火爆专区', style: TextStyle(color: Colors.pink)),
    );
  }

  //火爆专区内容
  Widget _hotContent(BuildContext context){
    if(hotGoddsList.length != 0){
      List<Widget> listWidget = hotGoddsList.map((val){
        return InkWell(
          onTap: (){
            print('点击了火爆商品');
             Application.router.navigateTo(context, "/details?id='hotOne'");  // 跳到商品详情页
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
                      child: Image.asset(val['image'], fit: BoxFit.cover,),
                    )
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Text('${val['cost']}'),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text('${val['oldCost']}', style: TextStyle(color: Colors.black12, decoration: TextDecoration.lineThrough, fontSize: 11.0),),
                      )
                     
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('${val['title']}',overflow: TextOverflow.ellipsis, maxLines: 1,),
                        )
                      )
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
    }else{
      return Text('暂无商品');
    }
  }

  // 火爆专区整合标题和内容
  Widget _hotGoods(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _hotContent(context)
        ],
      ),
    );
  }

}