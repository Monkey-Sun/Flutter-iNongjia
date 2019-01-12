import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';
@JsonSerializable()

class Model{
  Model(this.Status, this.StatusDesc, this.Context);
  String Status;
  String StatusDesc;
  Mcontext Context;
  //不同的类使用不同的mixin即可
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}


@JsonSerializable()
class Mcontext{
  Mcontext(this.chosens);
  List<Goods> chosens;
  //不同的类使用不同的mixin即可
  factory Mcontext.fromJson(Map<String, dynamic> json) => _$McontextFromJson(json);
  Map<String, dynamic> toJson() => _$McontextToJson(this);
}


@JsonSerializable()
class Goods{
  Goods(this.productName, this.productDesc, this.cover);
  String productName;
  String productDesc;
  String cover;
  //不同的类使用不同的mixin即可
  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}