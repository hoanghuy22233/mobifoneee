import 'package:json_annotation/json_annotation.dart';

import 'index.dart';

part 'register_app_request.g.dart';

@JsonSerializable()
class RegisterAppRequest {
  final String phone;
  final String email;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordCF;
  RegisterAppRequest({required this.phone, required this.passwordCF, required this.email, required this.password});
  factory RegisterAppRequest.fromJson(Map<String, dynamic> json) => _$RegisterAppRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterAppRequestToJson(this);
}