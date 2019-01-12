import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final String Status;
  final String StatusDesc;
  final Res Context;

  Model(this.StatusDesc, this.Status, this.Context);

  //不同的类使用不同的mixin即可
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Res {
  final List<Goods> modulesvm;
  final List<Goods> chosens;

  Res(this.modulesvm, this.chosens);

  //不同的类使用不同的mixin即可
  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);

  Map<String, dynamic> toJson() => _$ResToJson(this);
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

  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}
