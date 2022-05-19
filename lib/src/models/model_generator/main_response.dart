
import 'package:json_annotation/json_annotation.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';

part 'main_response.g.dart';

@JsonSerializable()
class Sliders {
final int? id;
final String? src,link,description;

const Sliders(
{this.id,
this.description,
this.link,
this.src});

factory Sliders.fromJson(Map<String, dynamic> json) => _$SlidersFromJson(json);

Map<String, dynamic> toJson() => _$SlidersToJson(this);
}

@JsonSerializable()
class ListPackages {
  final int? id;
  final int? price;
  @JsonKey(name: "category_id")
  final int? categoryId;
  final String? title,data;
  @JsonKey(name: 'expired_at')
  final String? expiredAt;

  const ListPackages(
      {this.id,
        this.price,
        this.data,
        this.categoryId,
      this.expiredAt,
      this.title});

  factory ListPackages.fromJson(Map<String, dynamic> json) => _$ListPackagesFromJson(json);

  Map<String, dynamic> toJson() => _$ListPackagesToJson(this);
}
@JsonSerializable()
class ListServices {
  final int? id;
  @JsonKey(name: "category_id")
  final int? categoryId;
  final String? title,thumbnail;

  const ListServices(
      {this.id,
        this.categoryId,
        this.thumbnail,
        this.title});

  factory ListServices.fromJson(Map<String, dynamic> json) => _$ListServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ListServicesToJson(this);
}

@JsonSerializable()
class Packages {
  @JsonKey(name: "category_id")
  final int? categoryId;
  final List<ListPackages>? list;

  const Packages(
      {this.categoryId,
        this.list});

  factory Packages.fromJson(Map<String, dynamic> json) => _$PackagesFromJson(json);

  Map<String, dynamic> toJson() => _$PackagesToJson(this);
}
@JsonSerializable()
class Services {
  @JsonKey(name: "category_id")
  final int? categoryId;
  final List<ListServices>? list;

  const Services(
      {this.categoryId,
        this.list});

  factory Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}

@JsonSerializable()
class InfoData {
  final int? id;
  final int? price;
  @JsonKey(name: "category_id")
  final int? categoryId;
  final String? thumbnail,data,expired_at,title;

  const InfoData(
      {this.categoryId,
        this.data,
        this.title,
        this.thumbnail,
        this.expired_at,
        this.price,
        this.id
        });

  factory InfoData.fromJson(Map<String, dynamic> json) => _$InfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDataToJson(this);
}

@JsonSerializable()
class MainData {
  @JsonKey(name:"wallet_money")
  final int? walletMoney;
  final List<Sliders>? sliders;
  final InfoData? info_data;
  final Packages? packages;
  final Services? services;

  const MainData(
      {this.walletMoney,
        this.info_data,
        this.sliders,
        this.packages,
        this.services});

  factory MainData.fromJson(Map<String, dynamic> json) => _$MainDataFromJson(json);
  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}

@JsonSerializable()
class MainResponse{
  final int? status;
  final String? message;
  final MainData? data;

  MainResponse(this.data, this.status, this.message);

  factory MainResponse.fromJson(Map<String, dynamic> json) => _$MainResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}
