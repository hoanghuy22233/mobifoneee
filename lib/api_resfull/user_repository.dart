import 'dart:io';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart' show Dio; // ignore: import_of_legacy_library_into_null_safe
import 'package:mobifone/api_resfull/dio_provider.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/storages/share_local.dart';
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Dio dio = Dio();
  final _controller = StreamController<AuthenticationStatus>();
  final _controllerUser = StreamController<InfoUser>();
  UserRepository(){
    print('Token : ${shareLocal.getString(PreferencesKey.TOKEN)}');
    statusUser.listen((event) {
      if(event.token == dotenv.env[PreferencesKey.TOKEN]!){
        dio = DioProvider.instance();
      }else{
        dio = DioProvider.instance(token: shareLocal.getString(PreferencesKey.TOKEN));
      }
    });
  }

  //==========================================> GET <=========================================

  Future<ResponseDataStatus> getInfoUser() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getInfoUser();

  Future<FirstIntroResponse> getFirstIntro() async => await RestClient(dio, baseUrl: dio.options.baseUrl).firstIntroduce();

  // Future<LogoResponse> getLogo() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getLogo();

  Future<ListNewsResponse> getListNews({required int pageSize, required int currentPage}) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListNews(pageSize, currentPage);

  Future<ListDocumentsResponse> getListDocuments() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListDocuments();

  Future<IntroduceResponse> getIntroduce() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getIntroduce();

  Future<CoursesResponse> getCourse() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getCourse();

  Future<DetailCoursesResponse> getDetailCourse(int id) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getDetailCourse(id);

  //=========================================> POST <=========================================

  Future<LoginResponse> loginApp({required String email, required String password}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).loginApp(LoginAppRequest(email: email, password: password));

  Future<ResponseStatus> registerApp({required String fullName, required String email, required String password}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).registerApp(RegisterAppRequest(fullname: fullName ,email: email, password: password));

  Future<ResponseStatus> changePassword({required ParamChangePassword paramChangePassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).changePassword(paramChangePassword);

  Future<ResponseDataStatus> forgotPassword({required ParamForgotPassword paramForgotPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).forgotPassword(paramForgotPassword);

  Future<ResponseOtpForgotPassword> otpForgotPassword({required String email, required String otpCode}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).otpForgotPassword(email, otpCode);

  Future<ResponseStatus> resetPassword({required ParamResetPassword paramResetPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).resetPassword(paramResetPassword);

  Future<ResponseDataStatus> postUpdateProfile({required ParamChangeInfo infoUser}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).postUpdateProfile(infoUser);

  Future<ResponseDataStatus> postUpdateProfileNotImage({required ParamChangeInfoNotImage infoUser}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).postUpdateProfileNotImage(infoUser);

  Future<ResponseDataStatus> orderCourse({required ParamOrderCourse paramOrderCourse}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).orderCourse(paramOrderCourse);


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<InfoUser> get statusUser async* {
    yield* _controllerUser.stream;
  }

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  void addUser(InfoUser user) => _controllerUser.add(user);

  void dispose(){
    _controllerUser.close();
    _controller.close();
  }
}