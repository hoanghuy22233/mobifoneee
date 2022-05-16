import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mobifone/src/base.dart';
import 'package:mobifone/src/models/index.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://onthicongchuc.net/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  // =================================> GET <===================================

  @GET(BASE_URL.GET_INFO_USER)
  Future<ResponseDataStatus> getInfoUser();

  @GET(BASE_URL.OTP_RESET_PASSWORD)
  Future<ResponseOtpForgotPassword> otpForgotPassword(@Query("email") String email, @Query("otp_code") String otpCode);

  @GET(BASE_URL.FIRST_INTRODUCE)
  Future<FirstIntroResponse> firstIntroduce();

  // @GET(BASE_URL.GET_LOGO)
  // Future<LoginResponse> getLogo();

  @GET(BASE_URL.GET_LIST_NEW)
  Future<ListNewsResponse> getListNews(@Query('pageSize') int pageSize, @Query('currentPage') int currentPage);

  @GET(BASE_URL.GET_LIST_DOCUMENTS)
  Future<ListDocumentsResponse> getListDocuments();

  @GET(BASE_URL.INTRODUCE)
  Future<IntroduceResponse> getIntroduce();

  @GET(BASE_URL.GET_LIST_COURSE)
  Future<CoursesResponse> getCourse();

  @GET(BASE_URL.DETAIL_COURSE)
  Future<DetailCoursesResponse> getDetailCourse(@Query('id') int id);

  // =================================> POST <==================================
  @POST(BASE_URL.LOGIN)
  Future<LoginResponse> loginApp(@Body() LoginAppRequest loginAppRequest);

  @POST(BASE_URL.REGISTER)
  Future<ResponseStatus> registerApp(@Body() RegisterAppRequest registerAppRequest);

  @POST(BASE_URL.CHANGE_PASSWORD)
  Future<ResponseStatus> changePassword(@Body() ParamChangePassword paramChangePassword);

  @POST(BASE_URL.FORGOT_PASSWORD)
  Future<ResponseDataStatus> forgotPassword(@Body() ParamForgotPassword paramForgotPassword);

  @POST(BASE_URL.RESET_PASSWORD)
  Future<ResponseStatus> resetPassword(@Body() ParamResetPassword paramResetPassword);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<ResponseDataStatus> postUpdateProfile(@Body() ParamChangeInfo infoUser);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<ResponseDataStatus> postUpdateProfileNotImage(@Body() ParamChangeInfoNotImage infoUser);

  @POST(BASE_URL.ORDER_COURSE)
  Future<ResponseDataStatus> orderCourse(@Body() ParamOrderCourse paramOrderCourse);

  @POST(BASE_URL.PROFILE)
  Future<ResponseDataStatus> postImages(@Part() File image, @Query('code') String code, @Query('email') String email, @Query('name') String name);
}