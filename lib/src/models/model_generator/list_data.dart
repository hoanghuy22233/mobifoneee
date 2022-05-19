import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:mobifone/src/models/index.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';
part 'list_data.g.dart';

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
class ListData {
  final int? id,price;
  final int? fee_every_day,category_id;
  final String? title,thumbnail,description,data,expired_at,phone,address;
  final Category? category;

  const ListData(
      {this.id,
        this.price,
        this.phone, this.fee_every_day,
        this.category_id, this.title, this.thumbnail,
        this.description, this.data, this.expired_at, this.category,
        this.address,
      });

  factory ListData.fromJson(Map<String, dynamic> json) => _$ListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);
}

@JsonSerializable()
class Links {
  final String? url,label;
  final bool? active;

  const Links(
      {this.url,
        this.label,
        this.active
      });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class DataList {
  final int? current_page,per_page,to,total;
  final String? first_page_url,last_page_url,next_page_url,prev_page_url;
  final List<Links>? links;
  final List<ListData>? data;

  const DataList({
    this.current_page, this.per_page, this.to,
    this.total, this.first_page_url,
    this.last_page_url, this.next_page_url,
    this.prev_page_url, this.links, this.data,
  });
  factory DataList.fromJson(Map<String, dynamic> json) => _$DataListFromJson(json);

  Map<String, dynamic> toJson() => _$DataListToJson(this);
}

@JsonSerializable()
class DataListResponse {
  final int? status;
  final String? message;
  final DataList? data;

  const DataListResponse({
    this.data,
    this.status, this.message,
  });
  factory DataListResponse.fromJson(Map<String, dynamic> json) => _$DataListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataListResponseToJson(this);
}

