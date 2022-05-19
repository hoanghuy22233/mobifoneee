import 'package:get/get.dart';
import 'package:mobifone/src/router.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateSplash() async => await Get.toNamed(ROUTE_NAMES.SPLASH);

  static navigateLogin() async => await Get.toNamed(ROUTE_NAMES.LOGIN);

  static navigateLogout() async => await Get.offAllNamed(ROUTE_NAMES.LOGIN);

  static navigateMain() async => await Get.offAllNamed(ROUTE_NAMES.MAIN);

  static navigateIntro() async => await Get.offAllNamed(ROUTE_NAMES.INTRO);

  static navigateForgotPassword() async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD);

  static navigateForgotPasswordOTP(email) async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_OTP, arguments: email);

  static navigateForgotPasswordReset() async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_RESET);

  static navigateChangePassword() async => await Get.toNamed(ROUTE_NAMES.CHANGE_PASSWORD);

  static navigateInformationAccount() async => await Get.offAllNamed(ROUTE_NAMES.INFORMATION_ACCOUNT);

  static navigateAccount() async => await Get.toNamed(ROUTE_NAMES.ACCOUNT);

  static navigateNotification() async => await Get.toNamed(ROUTE_NAMES.NOTIFICATION);

  static navigateDetailNotification() async => await Get.toNamed(ROUTE_NAMES.DETAIL_NOTIFICATION);

  static navigateData() async => await Get.toNamed(ROUTE_NAMES.DATA);

  static navigateCheckData() async => await Get.toNamed(ROUTE_NAMES.CHECK_DATA);

  static navigateDetailData() async => await Get.toNamed(ROUTE_NAMES.DETAIL_DATA);

  static navigateService() async => await Get.toNamed(ROUTE_NAMES.SERVICE);

  static navigateDetailService() async => await Get.toNamed(ROUTE_NAMES.DETAIL_SERVICE);

  static navigateHotline() async => await Get.toNamed(ROUTE_NAMES.HOTLINE);

  static navigateChangeInformation(int id) async => await Get.toNamed(ROUTE_NAMES.CHANGE_INFORMATION,arguments: id);

  static navigateChangeInformationAccount(arguments) async => await Get.toNamed(ROUTE_NAMES.CHANGE_INFORMATION_ACCOUNT, arguments: arguments);

  static navigateDetailNew(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_NEW, arguments: arguments);

  static navigateDetailDocument(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_DOCUMENT, arguments: arguments);

  static navigateEditInfo(arguments) async => await Get.toNamed(ROUTE_NAMES.EDIT_INFO, arguments: arguments);

  static navigateSearch() async => await Get.toNamed(ROUTE_NAMES.SEARCH_SCREEN);

  static navigateAddMoney() async => await Get.toNamed(ROUTE_NAMES.ADD_MONEY);

  static navigateTransferMoney() async => await Get.toNamed(ROUTE_NAMES.TRANSFER_MONEY);

  static navigateCourseDetailScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.COURSE_DETAIL_SCREEN, arguments: arguments);

  static navigateBuyCourseScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.BUY_COURSE, arguments: arguments);

}
