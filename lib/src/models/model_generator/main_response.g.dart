// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sliders _$SlidersFromJson(Map<String, dynamic> json) => Sliders(
      id: json['id'] as int?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      src: json['src'] as String?,
    );

Map<String, dynamic> _$SlidersToJson(Sliders instance) => <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'link': instance.link,
      'description': instance.description,
    };

ListPackages _$ListPackagesFromJson(Map<String, dynamic> json) => ListPackages(
      id: json['id'] as int?,
      price: json['price'] as int?,
      data: json['data'] as String?,
      categoryId: json['category_id'] as int?,
      expiredAt: json['expired_at'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ListPackagesToJson(ListPackages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'category_id': instance.categoryId,
      'title': instance.title,
      'data': instance.data,
      'expired_at': instance.expiredAt,
    };

ListServices _$ListServicesFromJson(Map<String, dynamic> json) => ListServices(
      id: json['id'] as int?,
      categoryId: json['category_id'] as int?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ListServicesToJson(ListServices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
    };

Packages _$PackagesFromJson(Map<String, dynamic> json) => Packages(
      categoryId: json['category_id'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListPackages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackagesToJson(Packages instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'list': instance.list,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      categoryId: json['category_id'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'list': instance.list,
    };

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      categoryId: json['category_id'] as int?,
      data: json['data'] as String?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      expired_at: json['expired_at'] as String?,
      price: json['price'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'category_id': instance.categoryId,
      'thumbnail': instance.thumbnail,
      'data': instance.data,
      'expired_at': instance.expired_at,
      'title': instance.title,
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
      walletMoney: json['wallet_money'] as int?,
      info_data: json['info_data'] == null
          ? null
          : InfoData.fromJson(json['info_data'] as Map<String, dynamic>),
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => Sliders.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: json['packages'] == null
          ? null
          : Packages.fromJson(json['packages'] as Map<String, dynamic>),
      services: json['services'] == null
          ? null
          : Services.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
      'wallet_money': instance.walletMoney,
      'sliders': instance.sliders,
      'info_data': instance.info_data,
      'packages': instance.packages,
      'services': instance.services,
    };

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) => MainResponse(
      json['data'] == null
          ? null
          : MainData.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as int?,
      json['message'] as String?,
    );

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
