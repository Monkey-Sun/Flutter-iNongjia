// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(json['StatusDesc'] as String, json['Status'] as String);
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'Status': instance.status,
      'StatusDesc': instance.statusDesc
    };
