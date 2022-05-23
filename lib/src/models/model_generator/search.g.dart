// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDataSearch _$ListDataSearchFromJson(Map<String, dynamic> json) =>
    ListDataSearch(
      id: json['id'] as int?,
      category_id: json['category_id'] as int?,
      data: json['data'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      expired_at: json['expired_at'] as String?,
      fee_every_day: json['fee_every_day'] as int?,
    );

Map<String, dynamic> _$ListDataSearchToJson(ListDataSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'price': instance.price,
      'title': instance.title,
      'data': instance.data,
      'expired_at': instance.expired_at,
      'fee_every_day': instance.fee_every_day,
    };

ListLinkSearch _$ListLinkSearchFromJson(Map<String, dynamic> json) =>
    ListLinkSearch(
      active: json['active'] as bool?,
      label: json['label'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ListLinkSearchToJson(ListLinkSearch instance) =>
    <String, dynamic>{
      'active': instance.active,
      'label': instance.label,
      'url': instance.url,
    };

DataSearch _$DataSearchFromJson(Map<String, dynamic> json) => DataSearch(
      current_page: json['current_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => ListLinkSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListDataSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
      last_page: json['last_page'] as int?,
      per_page: json['per_page'] as int?,
      total: json['total'] as int?,
      path: json['path'] as String?,
      first_page_url: json['first_page_url'] as String?,
      from: json['from'] as int?,
      last_page_url: json['last_page_url'] as String?,
      next_page_url: json['next_page_url'] as String?,
      prev_page_url: json['prev_page_url'] as String?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$DataSearchToJson(DataSearch instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'from': instance.from,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'prev_page_url': instance.prev_page_url,
      'links': instance.links,
      'data': instance.data,
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataSearch.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
