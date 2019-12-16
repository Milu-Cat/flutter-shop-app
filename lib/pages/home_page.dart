import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 需要下载flutter_swiper最新版
// import '../service/service_method.dart';  // 使用http时
import 'dart:convert' show json; // 解析json的依赖
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContext = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
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
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiper),
                TopNavigator(navigatorList: navigatorList),
                AdBanner(adPicture:adPicture),
                AdTell(adTell: adTell, leaderPhone: leaderPhone),
              ],
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

    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');
    
    return Container(
      height: ScreenUtil().setHeight(370),
      width: ScreenUtil().setWidth(1794.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.asset("${swiperDataList[index]['image']}", fit: BoxFit.fill);
        },
        itemCount: 3,
        pagination: SwiperPagination(),  //是否显示指示点
        autoplay: true, //自动播放
      ),
    );
  }
}


// 轮播下面的导航块
class TopNavigator extends StatelessWidget {

  final List navigatorList;
  TopNavigator({this.navigatorList});

  Widget _gridViewItemUi(BuildContext context, item){
    return InkWell(
      onTap: (){
        print('跳转');
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
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      height: ScreenUtil().setHeight(465),
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
      color: Colors.green,
      child: Image.asset(adPicture, fit: BoxFit.cover), 
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
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
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
    String url = 'tel' + leaderPhone;
    if(await canLaunch(url)){
      await launch(url);
      print('正在打电话');
    }else {
      throw 'url不能进行访问！';
    }
  }
}