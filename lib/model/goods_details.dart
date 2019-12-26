class GoodsDetailsModel {
  GoodInfo goodInfo;

  GoodsDetailsModel({this.goodInfo});

  GoodsDetailsModel.fromJson(Map<String, dynamic> json) {
    goodInfo = json['goodInfo'] != null
        ? new GoodInfo.fromJson(json['goodInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goodInfo != null) {
      data['goodInfo'] = this.goodInfo.toJson();
    }
    return data;
  }
}

class GoodInfo {
  String image;
  String name;
  String newPrice;
  String oldPrice;
  String introduceImage1;
  String introduceImage2;
  String introduceImage3;
  String introduceImage4;
  String introduceImage5;
  String introduceImage6;
  String introduceImage7;
  String introduceImage8;
  String introduceImage9;
  String introduceImage10;
  String introduceImage11;
  String introduceImage12;
  String introduceImage13;
  String introduceImage14;
  String introduceImage15;
  String introduceImage16;
  String introduceImage17;
  String introduceImage18;
  String introduceImage19;
  String introduceImage20;
  String introduceImage21;
  String introduceImage22;
  String introduceImage23;
  String introduceImage24;

  GoodInfo(
      {this.image,
      this.name,
      this.newPrice,
      this.oldPrice,
      this.introduceImage1,
      this.introduceImage2,
      this.introduceImage3,
      this.introduceImage4,
      this.introduceImage5,
      this.introduceImage6,
      this.introduceImage7,
      this.introduceImage8,
      this.introduceImage9,
      this.introduceImage10,
      this.introduceImage11,
      this.introduceImage12,
      this.introduceImage13,
      this.introduceImage14,
      this.introduceImage15,
      this.introduceImage16,
      this.introduceImage17,
      this.introduceImage18,
      this.introduceImage19,
      this.introduceImage20,
      this.introduceImage21,
      this.introduceImage22,
      this.introduceImage23,
      this.introduceImage24});

  GoodInfo.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    newPrice = json['newPrice'];
    oldPrice = json['oldPrice'];
    introduceImage1 = json['introduceImage1'];
    introduceImage2 = json['introduceImage2'];
    introduceImage3 = json['introduceImage3'];
    introduceImage4 = json['introduceImage4'];
    introduceImage5 = json['introduceImage5'];
    introduceImage6 = json['introduceImage6'];
    introduceImage7 = json['introduceImage7'];
    introduceImage8 = json['introduceImage8'];
    introduceImage9 = json['introduceImage9'];
    introduceImage10 = json['introduceImage10'];
    introduceImage11 = json['introduceImage11'];
    introduceImage12 = json['introduceImage12'];
    introduceImage13 = json['introduceImage13'];
    introduceImage14 = json['introduceImage14'];
    introduceImage15 = json['introduceImage15'];
    introduceImage16 = json['introduceImage16'];
    introduceImage17 = json['introduceImage17'];
    introduceImage18 = json['introduceImage18'];
    introduceImage19 = json['introduceImage19'];
    introduceImage20 = json['introduceImage20'];
    introduceImage21 = json['introduceImage21'];
    introduceImage22 = json['introduceImage22'];
    introduceImage23 = json['introduceImage23'];
    introduceImage24 = json['introduceImage24'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['newPrice'] = this.newPrice;
    data['oldPrice'] = this.oldPrice;
    data['introduceImage1'] = this.introduceImage1;
    data['introduceImage2'] = this.introduceImage2;
    data['introduceImage3'] = this.introduceImage3;
    data['introduceImage4'] = this.introduceImage4;
    data['introduceImage5'] = this.introduceImage5;
    data['introduceImage6'] = this.introduceImage6;
    data['introduceImage7'] = this.introduceImage7;
    data['introduceImage8'] = this.introduceImage8;
    data['introduceImage9'] = this.introduceImage9;
    data['introduceImage10'] = this.introduceImage10;
    data['introduceImage11'] = this.introduceImage11;
    data['introduceImage12'] = this.introduceImage12;
    data['introduceImage13'] = this.introduceImage13;
    data['introduceImage14'] = this.introduceImage14;
    data['introduceImage15'] = this.introduceImage15;
    data['introduceImage16'] = this.introduceImage16;
    data['introduceImage17'] = this.introduceImage17;
    data['introduceImage18'] = this.introduceImage18;
    data['introduceImage19'] = this.introduceImage19;
    data['introduceImage20'] = this.introduceImage20;
    data['introduceImage21'] = this.introduceImage21;
    data['introduceImage22'] = this.introduceImage22;
    data['introduceImage23'] = this.introduceImage23;
    data['introduceImage24'] = this.introduceImage24;
    return data;
  }
}