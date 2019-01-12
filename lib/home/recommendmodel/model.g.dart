// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
      json['StatusDesc'] as String,
      json['Status'] as String,
      json['Context'] == null
          ? null
          : Res.fromJson(json['Context'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusDesc': instance.StatusDesc,
      'Context': instance.Context
    };

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(
      (json['modulesvm'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['chosens'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['midBanners'] as List)
          ?.map((e) =>
              e == null ? null : Banner.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'modulesvm': instance.modulesvm,
      'chosens': instance.chosens,
      'midBanners': instance.midBanners
    };

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      json['productId'] as int,
      json['productName'] as String,
      json['productStatus'] as int,
      json['area'] as String,
      json['avatar'] as String,
      json['nickname'] as String,
      (json['rawPrice'] as num)?.toDouble(),
      (json['price'] as num)?.toDouble(),
      json['cover'] as String,
      json['productDesc'] as String,
      (json['percent'] as num)?.toDouble(),
      json['tagName'] as String);
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productStatus': instance.productStatus,
      'area': instance.area,
      'avatar': instance.avatar,
      'nickname': instance.nickname,
      'rawPrice': instance.rawPrice,
      'price': instance.price,
      'cover': instance.cover,
      'productDesc': instance.productDesc,
      'percent': instance.percent,
      'tagName': instance.tagName
    };

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(json['imgUrl'] as String);
}

Map<String, dynamic> _$BannerToJson(Banner instance) =>
    <String, dynamic>{'imgUrl': instance.imgUrl};
