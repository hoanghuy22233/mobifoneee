import 'package:json_annotation/json_annotation.dart';

import 'info_user.dart';

part 'login_app_request.g.dart';

@JsonSerializable()
class LoginAppRequest {
  @JsonKey(name: "email")
  final String email;
  final String password;
  LoginAppRequest({required this.email, required this.password});
  factory LoginAppRequest.fromJson(Map<String, dynamic> json) => _$LoginAppRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginAppRequestToJson(this);
}

