// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_data.dart';

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

DetailData _$DetailDataFromJson(Map<String, dynamic> json) => DetailData(
      id: json['id'] as int?,
      price: json['price'] as int?,
      fee_every_day: json['fee_every_day'] as int?,
      category_id: json['category_id'] as int?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      expired_at: json['expired_at'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$DetailDataToJson(DetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'fee_every_day': instance.fee_every_day,
      'category_id': instance.category_id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'expired_at': instance.expired_at,
      'description': instance.description,
      'content': instance.content,
      'data': instance.data,
    };

DetailDataResponse _$DetailDataResponseFromJson(Map<String, dynamic> json) =>
    DetailDataResponse(
      data: json['data'] == null
          ? null
          : DetailData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DetailDataResponseToJson(DetailDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
