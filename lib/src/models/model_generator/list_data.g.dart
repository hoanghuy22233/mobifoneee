// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_data.dart';

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

ListData _$ListDataFromJson(Map<String, dynamic> json) => ListData(
      id: json['id'] as int?,
      price: json['price'] as int?,
      phone: json['phone'] as String?,
      fee_every_day: json['fee_every_day'] as int?,
      category_id: json['category_id'] as int?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      data: json['data'] as String?,
      expired_at: json['expired_at'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'fee_every_day': instance.fee_every_day,
      'category_id': instance.category_id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'data': instance.data,
      'expired_at': instance.expired_at,
      'phone': instance.phone,
      'address': instance.address,
      'category': instance.category,
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
          ?.map((e) => ListData.fromJson(e as Map<String, dynamic>))
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

DataListResponse _$DataListResponseFromJson(Map<String, dynamic> json) =>
    DataListResponse(
      data: json['data'] == null
          ? null
          : DataList.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DataListResponseToJson(DataListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
