import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:mobifone/src/models/index.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';
part 'detail_data.g.dart';

@JsonSerializable()
class Category {
  final int? id;
  final String? name;

  const Category( {
    this.id,
    this.name,
  });
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class DetailData {
  final int? id;
  final int? price,fee_every_day,category_id;
  final String? title,thumbnail,updated_at;
  final String? created_at,expired_at,description,content,data;

  const DetailData({
    this.id,
    this.price, this.fee_every_day,
    this.category_id, this.title,
    this.thumbnail, this.updated_at,
    this.created_at, this.expired_at,
    this.description, this.content, this.data,
  });
  factory DetailData.fromJson(Map<String, dynamic> json) => _$DetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailDataToJson(this);
}

@JsonSerializable()
class DetailDataResponse {
  final int? status;
  final String? message;
  final DetailData? data;
  const DetailDataResponse( {
    this.data,
    this.status,
    this.message

  });
  factory DetailDataResponse.fromJson(Map<String, dynamic> json) => _$DetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailDataResponseToJson(this);
}
