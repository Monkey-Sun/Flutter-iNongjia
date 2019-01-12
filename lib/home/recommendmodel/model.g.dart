// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
      json['Status'] as String,
      json['StatusDesc'] as String,
      json['Context'] == null
          ? null
          : Mcontext.fromJson(json['Context'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusDesc': instance.StatusDesc,
      'Context': instance.Context
    };

Mcontext _$McontextFromJson(Map<String, dynamic> json) {
  return Mcontext((json['chosens'] as List)
      ?.map((e) => e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$McontextToJson(Mcontext instance) =>
    <String, dynamic>{'chosens': instance.chosens};

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(json['productName'] as String, json['productDesc'] as String,
      json['cover'] as String);
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'productName': instance.productName,
      'productDesc': instance.productDesc,
      'cover': instance.cover
    };
