import 'package:json_annotation/json_annotation.dart';
part 'params_change_password.g.dart';
@JsonSerializable()
class ParamChangePassword {
  @JsonKey(name: "password")
  String oldPass;
  @JsonKey(name: "newPassword")
  String newPass;

  ParamChangePassword(
      {
        required this.oldPass,
        required this.newPass,
      });

  factory ParamChangePassword.fromJson(Map<String, dynamic> json) => _$ParamChangePasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangePasswordToJson(this);
}

@JsonSerializable()
class ParamForgotPassword {
  String email;

  ParamForgotPassword(
      {
        required this.email,
      });

  factory ParamForgotPassword.fromJson(Map<String, dynamic> json) => _$ParamForgotPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ParamForgotPasswordToJson(this);
}

@JsonSerializable()
class ParamResetPassword {
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "newPassword")
  final String newPass;

  factory ParamResetPassword.fromJson(Map<String, dynamic> json) => _$ParamResetPasswordFromJson(json);

  ParamResetPassword(this.password, this.newPass);

  Map<String, dynamic> toJson() => _$ParamResetPasswordToJson(this);
}

