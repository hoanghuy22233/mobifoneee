import 'package:json_annotation/json_annotation.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';

part 'notification.g.dart';

@JsonSerializable()
class ListNotification {
  final int? id;
  final int? category_id,price;
  final String? title,alias,thumbnail,description,data,content,date,status,user_id,created_at,updated_at;

  const ListNotification(
      {this.id,
        this.alias, this.thumbnail, this.description, this.content, this.date, this.status, this.user_id, this.created_at,
        this.category_id,
        this.data,
        this.title,
        this.price,
        this.updated_at,
      });

  factory ListNotification.fromJson(Map<String, dynamic> json) => _$ListNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationToJson(this);
}

@JsonSerializable()
class ListLinkNotification {
  final bool? active;
  final String? label,url;

  const ListLinkNotification(
      {this.active,
        this.label,
        this.url});

  factory ListLinkNotification.fromJson(Map<String, dynamic> json) => _$ListLinkNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ListLinkNotificationToJson(this);
}
@JsonSerializable()
class NotificationData {
  final int? current_page,last_page,per_page,to,total,from;
  final String? first_page_url,last_page_url,next_page_url,path,prev_page_url;
  final List<ListLinkNotification>? links;
  final List<ListNotification>? data;

  const NotificationData(
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

  factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
@JsonSerializable()
class NotificationResponse {
  final int? status;
  final String? message;
  final NotificationData? data;

  const NotificationResponse(
      {this.status,
        this.message, this.data,
      });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}