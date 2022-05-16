import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mobifone/screens/forgot_password/forgot_password_otp_screen.dart';
import 'package:mobifone/screens/menu/utilities/search/search.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/src/base.dart';
import 'package:mobifone/src/messages.dart';
import 'package:mobifone/src/router.dart';
import 'package:mobifone/storages/storages.dart';
import 'api_resfull/api.dart';
import 'bloc/blocs.dart';

Future main() async {
  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: BASE_URL.ENV);
  shareLocal = await ShareLocal.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  UserRepository userRepository = UserRepository();
  if (defaultTargetPlatform == TargetPlatform.android) {
  }runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
            localRepository: const EventRepositoryStorage(),
          )..add(AuthenticationStateInit()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<ChangePasswordBloc>(
            create: (context) => ChangePasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => ForgotPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ForgotPasswordOTPBloc>(
            create: (context) => ForgotPasswordOTPBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ResetPasswordBloc>(
            create: (context) => ResetPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ResendOTPBloc>(
            create: (context) => ResendOTPBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<InfoUserBloc>(
            create: (context) => InfoUserBloc(
                userRepository: userRepository,
                localRepository: const EventRepositoryStorage(),
                context: context
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                userRepository: userRepository
            ),
          ),

        ],
        child: const MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      title: MESSAGES.APP_TITLE,
      initialRoute: ROUTE_NAMES.SPLASH,
      getPages: [
        GetPage(
          name: ROUTE_NAMES.MAIN,
          page: () => MainScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.INFORMATION_ACCOUNT,
          page: () => InformationAccount(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHANGE_INFORMATION,
          page: () => ChangeInformation(),
        ),
        GetPage(
          name: ROUTE_NAMES.ACCOUNT,
          page: () => AccountScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHECK_DATA,
          page: () => CheckDataScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.DETAIL_SERVICE,
          page: () => DetailService(),
        ),
        GetPage(
          name: ROUTE_NAMES.SERVICE,
          page: () => ServiceScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.DATA,
          page: () => DataScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.DETAIL_DATA,
          page: () => DetailData(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHANGE_PASSWORD,
          page: () => ChangePassWordPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.NOTIFICATION,
          page: () => NotificationScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.DETAIL_NOTIFICATION,
          page: () => DetailNotification(),
        ),
        GetPage(
          name: ROUTE_NAMES.ADD_MONEY,
          page: () => AddMoney(),
        ),
        GetPage(
          name: ROUTE_NAMES.TRANSFER_MONEY,
          page: () => TransferMoney(),
        ),
        GetPage(
          name: ROUTE_NAMES.SEARCH_SCREEN,
          page: () => SearchScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.SPLASH,
          page: () => SplashPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.LOGIN,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD,
          page: () => ForgotPasswordScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD_OTP,
          page: () => ForgotPasswordOTPScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD_RESET,
          page: () => ForgotPasswordResetScreen(),
        ),

      ],
    );
  }
}
