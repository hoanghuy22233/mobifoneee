import 'package:json_annotation/json_annotation.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';

part 'using_data.g.dart';

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
class ListDataUsing {
  final int? id;
  final int? category_id,price;
  final String? title,data,expired_at,fee_every_day;

  const ListDataUsing(
      {this.id,
        this.category_id,
        this.data,
        this.title,
        this.price,
        this.expired_at,
        this.fee_every_day});

  factory ListDataUsing.fromJson(Map<String, dynamic> json) => _$ListDataUsingFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataUsingToJson(this);
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
  final List<ListDataUsing>? data;

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
class DataUsingResponse {
  final int? status;
  final String? message;
  final DataList? data;

  const DataUsingResponse({
    this.data,
    this.status, this.message,
  });
  factory DataUsingResponse.fromJson(Map<String, dynamic> json) => _$DataUsingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataUsingResponseToJson(this);
}