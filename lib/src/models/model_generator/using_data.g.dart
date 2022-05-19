// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'using_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ListDataUsing _$ListDataUsingFromJson(Map<String, dynamic> json) =>
    ListDataUsing(
      id: json['id'] as int?,
      category_id: json['category_id'] as int?,
      data: json['data'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      expired_at: json['expired_at'] as String?,
      fee_every_day: json['fee_every_day'] as String?,
    );

Map<String, dynamic> _$ListDataUsingToJson(ListDataUsing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'price': instance.price,
      'title': instance.title,
      'data': instance.data,
      'expired_at': instance.expired_at,
      'fee_every_day': instance.fee_every_day,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

DataList _$DataListFromJson(Map<String, dynamic> json) => DataList(
      current_page: json['current_page'] as int?,
      per_page: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
      first_page_url: json['first_page_url'] as String?,
      last_page_url: json['last_page_url'] as String?,
      next_page_url: json['next_page_url'] as String?,
      prev_page_url: json['prev_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListDataUsing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'prev_page_url': instance.prev_page_url,
      'links': instance.links,
      'data': instance.data,
    };

DataUsingResponse _$DataUsingResponseFromJson(Map<String, dynamic> json) =>
    DataUsingResponse(
      data: json['data'] == null
          ? null
          : DataList.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DataUsingResponseToJson(DataUsingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
