// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotification _$ListNotificationFromJson(Map<String, dynamic> json) =>
    ListNotification(
      id: json['id'] as int?,
      alias: json['alias'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      user_id: json['user_id'] as String?,
      created_at: json['created_at'] as String?,
      category_id: json['category_id'] as int?,
      data: json['data'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ListNotificationToJson(ListNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'price': instance.price,
      'title': instance.title,
      'alias': instance.alias,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'data': instance.data,
      'content': instance.content,
      'date': instance.date,
      'status': instance.status,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

ListLinkNotification _$ListLinkNotificationFromJson(
        Map<String, dynamic> json) =>
    ListLinkNotification(
      active: json['active'] as bool?,
      label: json['label'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ListLinkNotificationToJson(
        ListLinkNotification instance) =>
    <String, dynamic>{
      'active': instance.active,
      'label': instance.label,
      'url': instance.url,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      current_page: json['current_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => ListLinkNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListNotification.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
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

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
