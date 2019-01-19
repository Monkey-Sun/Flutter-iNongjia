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
      json['content'] as String);
}

Map<String, dynamic> _$FindItemToJson(FindItem instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'createTime': instance.createTime?.toIso8601String(),
      'content': instance.content
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
