// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
      json['Status'],
      json['StatusDesc'],
      (json['Context'] as List)
          ?.map((e) =>
              e == null ? null : FindItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'Status': instance.status,
      'StatusDesc': instance.statusDesc,
      'Context': instance.context
    };

FindItem _$FindItemFromJson(Map<String, dynamic> json) {
  return FindItem(
      json['nickname'] as String,
      json['avatar'] as String,
      json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      json['content'] as String,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      (json['users'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FindItemToJson(FindItem instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'createTime': instance.createTime?.toIso8601String(),
      'content': instance.content,
      'product': instance.product,
      'users': instance.users
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      json['textContent'] as String,
      (json['photos'] as List)
          ?.map((e) =>
              e == null ? null : Photo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'textContent': instance.textContent,
      'photos': instance.photos
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(json['ThumbUrl'] as String, json['ImgUrl'] as String);
}

Map<String, dynamic> _$PhotoToJson(Photo instance) =>
    <String, dynamic>{'ThumbUrl': instance.thumbUrl, 'ImgUrl': instance.imgUrl};

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(json['productId'] as int, json['productName'] as String,
      json['cover'] as String, json['productDesc'] as String);
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'cover': instance.cover,
      'productDesc': instance.productDesc
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['avatar'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'avatar': instance.avatar};
