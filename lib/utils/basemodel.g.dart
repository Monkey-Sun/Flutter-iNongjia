// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(
      json['StatusDesc'] as String, json['Status'] as String, json['Context']);
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'Status': instance.Status,
      'StatusDesc': instance.StatusDesc,
      'Context': instance.Context
    };
