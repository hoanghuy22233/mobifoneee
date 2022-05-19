import 'package:json_annotation/json_annotation.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';

part 'search.g.dart';

@JsonSerializable()
class ListDataSearch {
  final int? id;
  final int? category_id,price;
  final String? title,data,expired_at;
  final int? fee_every_day;

  const ListDataSearch(
      {this.id,
        this.category_id,
      this.data,
      this.title,
      this.price,
      this.expired_at,
      this.fee_every_day});

  factory ListDataSearch.fromJson(Map<String, dynamic> json) => _$ListDataSearchFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataSearchToJson(this);
}

@JsonSerializable()
class ListLinkSearch {
final bool? active;
final String? label,url;

const ListLinkSearch(
{this.active,
this.label,
this.url});

factory ListLinkSearch.fromJson(Map<String, dynamic> json) => _$ListLinkSearchFromJson(json);

Map<String, dynamic> toJson() => _$ListLinkSearchToJson(this);
}
@JsonSerializable()
class DataSearch {
  final int? current_page,last_page,per_page,to,total,from;
  final String? first_page_url,last_page_url,next_page_url,path,prev_page_url;
  final List<ListLinkSearch>? links;
  final List<ListDataSearch>? data;

  const DataSearch(
      {this.current_page,
        this.links, this.data,
        this.last_page,
        this.per_page,
      this.total,
      this.path,
      this.first_page_url,
      this.from,
      this.last_page_url,
      this.next_page_url,
      this.prev_page_url,
      this.to});

  factory DataSearch.fromJson(Map<String, dynamic> json) => _$DataSearchFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchToJson(this);
}
@JsonSerializable()
class SearchResponse {
  final int? status;
  final String? message;
  final DataSearch? data;

  const SearchResponse(
      {this.status,
        this.message, this.data,
        });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
