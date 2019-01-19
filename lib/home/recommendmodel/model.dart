import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final String Status;
  final String StatusDesc;
  final Res Context;

  Model(this.StatusDesc, this.Status, this.Context);

  //这一步是 map 转 dart模型
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  //这一步是 转map 由于dio返回的是一个 map 因此这一步可省去
//  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Res {
  final List<Goods> modulesvm;
  final List<Goods> chosens;
  final List<Banner> midBanners;

  Res(this.modulesvm, this.chosens, this.midBanners);

  //不同的类使用不同的mixin即可
  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);
}

@JsonSerializable()
class Goods {
  final int productId;
  final String productName;
  final int productStatus;
  final String area;
  final String avatar;
  final String nickname;
  final double rawPrice;
  final double price;
  final String cover;
  final String productDesc;
  final double percent;
  final String tagName;

  Goods(
      this.productId,
      this.productName,
      this.productStatus,
      this.area,
      this.avatar,
      this.nickname,
      this.rawPrice,
      this.price,
      this.cover,
      this.productDesc,
      this.percent,
      this.tagName);

  //不同的类使用不同的mixin即可
  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

}


@JsonSerializable()

class Banner extends Object{
  final String imgUrl;
  Banner(this.imgUrl);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
