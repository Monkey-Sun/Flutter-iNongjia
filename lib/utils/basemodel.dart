import 'package:json_annotation/json_annotation.dart';
part 'basemodel.g.dart';

@JsonSerializable()

class BaseModel {
  final String Status;
  final String StatusDesc;
  final Object Context;

  BaseModel(this.StatusDesc, this.Status, this.Context);

  //不同的类使用不同的mixin即可
  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}