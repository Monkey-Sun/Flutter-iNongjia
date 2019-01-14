import 'package:flutter_app/utils/basemodel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

class Model extends BaseModel{
  final List<FindItem> Context;
  Model(Status, StatusDesc, this.Context):super(Status, StatusDesc, Context);
  //不同的类使用不同的mixin即可
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}


@JsonSerializable()
class FindItem{
  final int userId;
  FindItem(this.userId);
  //不同的类使用不同的mixin即可
  factory FindItem.fromJson(Map<String, dynamic> json) => _$FindItemFromJson(json);

  Map<String, dynamic> toJson() => _$FindItemToJson(this);
}


