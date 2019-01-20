import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app/utils/basemodel.dart';
import 'dart:convert';

part 'model.g.dart';

@JsonSerializable()
class Model extends BaseModel {
  @JsonKey(name: 'Context')
  final List<FindItem> context;

  Model(status, statusDesc, this.context) : super(status, statusDesc);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

@JsonSerializable()
class FindItem {
  final String nickname;
  final String avatar;
  final DateTime createTime;
  final Content content;
  final Product product;
  final List<User> users;

  // 非常重要 因为 原始数据content 是一个json字符串， 需要这样转一下 才能成为对象  昨晚的写法的简写
  FindItem(this.nickname, this.avatar, this.createTime, String content, this.product, this.users)
      : content = Content.fromJson(jsonDecode(content));// 对final属性进行初始化

  factory FindItem.fromJson(Map<String, dynamic> json) =>
      _$FindItemFromJson(json);
}

@JsonSerializable()
class Content {
  String textContent;
  List<Photo> photos;

  Content(this.textContent, this.photos);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: 'ThumbUrl')
  final String thumbUrl;
  @JsonKey(name: 'ImgUrl')
  final String imgUrl;

  Photo(this.thumbUrl, this.imgUrl);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}


@JsonSerializable()

class Product{
  final int productId;
  final String productName;
  final String cover;
  final String productDesc;

  Product(this.productId, this.productName, this.cover, this.productDesc);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@JsonSerializable()

class User{
  final String avatar;
  User(this.avatar);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}