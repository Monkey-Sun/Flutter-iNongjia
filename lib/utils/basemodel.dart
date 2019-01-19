import 'package:json_annotation/json_annotation.dart';
part 'basemodel.g.dart';

@JsonSerializable()

class BaseModel {
  @JsonKey(name: 'Status')
  final String status;
  @JsonKey(name: 'StatusDesc')
  final String statusDesc;

  BaseModel(this.statusDesc, this.status);

  //不同的类使用不同的mixin即可
  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}