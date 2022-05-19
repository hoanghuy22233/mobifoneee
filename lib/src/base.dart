// ignore: camel_case_types
class BASE_URL {
  BASE_URL._();

  static const GET_INFO_USER = 'api/user/profile';
  static const LOGIN = 'api/login';
  static const MAIN_DATA = 'api/home';
  static const CHANGE_INFO = 'api/user/update';
  static const LIST_DATA = 'api/get-data-by-category';
  static const REGISTER = 'api/register';
  static const SEARCH = 'api/search-data';
  static const PROFILE = 'api/user/profile';
  static const EDIT_PROFILE = 'api/user/update-info-user';
  static const CHANGE_PASSWORD = 'api/user/change-password';
  static const FORGOT_PASSWORD = 'api/user/forgot-password';
  static const OTP_RESET_PASSWORD = 'api/user/vertify-otp';
  static const RESET_PASSWORD = 'api/user/new-password';
  static const FIRST_INTRODUCE = 'api/user/introductions';
  static const INTRODUCE = 'api/user/introductions2';
  static const GET_LOGO = 'api/user/config-logo';
  static const GET_LIST_NEW = 'api/user/news';
  static const GET_LIST_DOCUMENTS = 'api/user/documentations';
  static const GET_LIST_COURSE = 'api/user/list-course';
  static const DETAIL_COURSE = 'api/user/detail-course';
  static const ORDER_COURSE = 'api/user/order';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  static const ENV  = 'assets/.env';

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const content_type = 'Content-Type';
  static const application_json = 'application/json';
  ////////////////////////////////////////////////////////
  static const multipart_form_data = 'multipart/form-data';

  static const auth_type = 'Authorization';
  ////////////////////////////////////////////////////////
  static String bearer(String token) => token;

  static const headerDemoKey = 'Demo-Header';
  static const headerDemoValue = 'demo header';

  static const SUCCESS = 0;
  static const SUCCESS_200 = 200;
  static const FAIL = 9100;

  static const ACTIVE = 1;
  static const LOCK = 0;
}
