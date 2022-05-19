import 'package:json_annotation/json_annotation.dart';
part 'params_change_info.g.dart';
@JsonSerializable()
class ParamChangeInfo {
  String fullname, phone, email, date_or_birth;

  ParamChangeInfo({
    required this.phone,
    required this.email,
    required this.fullname,
    required this.date_or_birth,
  });

  factory ParamChangeInfo.fromJson(Map<String, dynamic> json) => _$ParamChangeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangeInfoToJson(this);

  List<Object?> get props => [fullname, phone, email,date_or_birth];
}

@JsonSerializable()
class ParamChangeInfoNotImage {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_code")
  String userCode;
  @JsonKey(name: "fullname")
  String fullname;
  String phone, email, gender, address;

  ParamChangeInfoNotImage({
    required this.id,
    required this.userCode,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
  });

  factory ParamChangeInfoNotImage.fromJson(Map<String, dynamic> json) => _$ParamChangeInfoNotImageFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangeInfoNotImageToJson(this);

  List<Object?> get props => [id, userCode, fullname, phone, email, gender, address];
}
