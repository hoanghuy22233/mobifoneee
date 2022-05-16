// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:community_material_icon/community_material_icon.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:mobifone/bloc/blocs.dart';
// import 'package:mobifone/screens/forgot_password/index.dart';
// import 'package:mobifone/src/src_index.dart';
// import 'package:mobifone/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../bloc/forgot_password_new_password/forgot_password_new_password_bloc.dart';
//
//
// class ForgotPasswordResetScreen extends StatefulWidget {
//
//   @override
//   ForgotPasswordResetScreenState createState() => ForgotPasswordResetScreenState();
// }
//
// class ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
//   final _passwordFocusNode = FocusNode();
//   final _forgotPasswordFocusNode = FocusNode();
//
//   bool obscurePassword = true;
//   bool obscureForgotPassword = true;
//
//   TextEditingController pass = TextEditingController();
//   TextEditingController newPass = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _passwordFocusNode.addListener(() {
//       if (!_passwordFocusNode.hasFocus) {
//         context.read<ForgotChangePasswordBloc>().add(ForgotPasswordUnfocused());
//       }
//     });
//     _forgotPasswordFocusNode.addListener(() {
//       if (!_forgotPasswordFocusNode.hasFocus) {
//         context.read<ForgotChangePasswordBloc>().add(ForgotNewPasswordUnfocused());
//       }
//     });
//
//   }
//
//   @override
//   void dispose() {
//     _passwordFocusNode.dispose();
//     _forgotPasswordFocusNode.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final bloc = ForgotChangePasswordBloc.of(context);
//     return BlocListener<ForgotChangePasswordBloc, ForgotChangePasswordState>(
//       listener: (context, state){
//         // if (state.status.isSubmissionSuccess) {
//         //   GetSnackBarUtils.removeSnackBar();
//         //   showDialog(
//         //     context: context,
//         //     barrierDismissible: false,
//         //     builder: (BuildContext context) {
//         //       return WidgetDialog(
//         //         title: MESSAGES.NOTIFICATION,
//         //         content: MESSAGES.SUCCESS,
//         //         //onTap1: ()=> AppNavigator.navigateLogin(),
//         //         onTap1: (){
//         //           Get.offAllNamed(ROUTE_NAMES.LOGIN, arguments: 'forgot_pass');
//         //         },
//         //       );
//         //     },
//         //   );
//         // }
//         // if (state.status.isSubmissionInProgress) {
//         //   GetSnackBarUtils.createProgress();
//         // }
//         // if (state.status.isSubmissionFailure) {
//         //   GetSnackBarUtils.removeSnackBar();
//         //   showDialog(
//         //     context: context,
//         //     builder: (BuildContext context) {
//         //       return WidgetDialog(
//         //         title: MESSAGES.NOTIFICATION,
//         //         content: state.message,
//         //       );
//         //     },
//         //   );
//         //
//         //   //GetSnackBarUtils.createFailure(message: state.message);
//         // }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             child: WidgetTouchHideKeyBoard(
//               child: Container(
//                   height: AppValue.heights,color: COLORS.WHITE,
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height: 40,),
//                         WidgetContainerImage(
//                           image: IMAGES.LOGO_APP,
//                           height: 80,
//                           width: 80,
//                         ),
//                         AppValue.vSpaceMedium,
//                         Text('Cập nhật mật khẩu',style: AppStyle.DEFAULT_16_BOLD,),
//                         AppValue.vSpaceTiny,
//                         Text('Nhập mật khẩu mới để đăng nhập tài khoản',style: AppStyle.DEFAULT_14,),
//                         AppValue.vSpaceMedium,
//                         _buildTextFieldPassword(bloc),
//                         AppValue.vSpaceMedium,
//                         _buildTextFieldForgotPassword(bloc),
//                         AppValue.vSpaceMedium,
//                         _buildButtonRegister(bloc),
//                       ],
//                     ),
//                   )
//               ),
//             )
//         ),
//       ),
//     );
//   }
//   _buildTextFieldPassword(ForgotChangePasswordBloc bloc) {
//     return BlocBuilder<ForgotChangePasswordBloc, ForgotChangePasswordState>(
//         builder: (context, state) {
//           return WidgetInput(
//             onChanged: (value) => bloc.add(ForgotPasswordChanged(password: value)),
//             errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
//             obscureText: obscurePassword,
//             focusNode: _passwordFocusNode,
//             boxDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(width: 1.5,color: Colors.grey)
//             ),
//             hint: MESSAGES.PASSWORD_HINT,
//             endIcon: GestureDetector(
//               onTap: () => setState(() => obscurePassword = !obscurePassword),
//               child: Icon(
//                 obscurePassword
//                     ? CommunityMaterialIcons.eye_outline
//                     : CommunityMaterialIcons.eye_off_outline,
//                 color: COLORS.GREY,
//                 size: 25,
//               ),
//             ),
//           );
//         }
//     );
//   }
//
//   _buildTextFieldForgotPassword(ForgotChangePasswordBloc bloc) {
//     return BlocBuilder<ForgotChangePasswordBloc, ForgotChangePasswordState>(
//         builder: (context, state) {
//           return WidgetInput(
//             onChanged: (value) => bloc.add(ForgotPasswordChanged(password: value)),
//             errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
//             obscureText: obscureForgotPassword,
//             focusNode: _forgotPasswordFocusNode,
//             boxDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(width: 1.5,color: Colors.grey)
//             ),
//             hint: MESSAGES.PASSWORD_HINT,
//             endIcon: GestureDetector(
//               onTap: () => setState(() => obscureForgotPassword = !obscureForgotPassword),
//               child: Icon(
//                 obscureForgotPassword
//                     ? CommunityMaterialIcons.eye_outline
//                     : CommunityMaterialIcons.eye_off_outline,
//                 color: COLORS.GREY,
//                 size: 25,
//               ),
//             ),
//           );
//         }
//     );
//   }
//   _buildButtonRegister(ForgotChangePasswordBloc bloc) {
//     return BlocBuilder<ForgotChangePasswordBloc, ForgotChangePasswordState>(
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (context, state) {
//           return WidgetButton(
//             // onTap: () => state.status.isValidated ? bloc.add(RegisterFormSubmitted()) : null,
//             // enable: state.status.isValidated,
//             onTap: (){},
//             backgroundColor: COLORS.PRIMARY_COLOR,
//             text: MESSAGES.NEXT,
//           );
//         }
//     );
//   }
// }
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/src_index.dart';
import '../../widgets/widget_button.dart';
import '../../widgets/widget_input.dart';

class ForgotPasswordResetScreen extends StatefulWidget {
  const ForgotPasswordResetScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordResetScreen> createState() => _ForgotPasswordResetScreenState();
}

class _ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
  final _passwordFocusNode = FocusNode();
  final _forgotPasswordFocusNode = FocusNode();

  bool obscurePassword = true;
  bool obscureForgotPassword = true;

  TextEditingController pass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: AppValue.heights,color: COLORS.WHITE,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  WidgetContainerImage(
                    image: IMAGES.LOGO_APP,
                    height: 80,
                    width: 80,
                  ),
                  AppValue.vSpaceMedium,
                  Text('Cập nhật mật khẩu',style: AppStyle.DEFAULT_16_BOLD,),
                  AppValue.vSpaceTiny,
                  Text('Nhập mật khẩu mới để đăng nhập tài khoản',style: AppStyle.DEFAULT_14,),
                  AppValue.vSpaceMedium,
                  _buildTextFieldPassword(),
                  AppValue.vSpaceMedium,
                  _buildTextFieldForgotPassword(),
                  AppValue.vSpaceMedium,
                  _buildButtonRegister(),
                ],
              ),
            )
        )
      ),
    );
  }
  _buildTextFieldPassword() {
    return WidgetInput(
      // onChanged: (value) => bloc.add(ForgotPasswordChanged(password: value)),
      // errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
      obscureText: obscurePassword,
      focusNode: _passwordFocusNode,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5,color: Colors.grey)
      ),
      hint: MESSAGES.PASSWORD_HINT,
      endIcon: GestureDetector(
        onTap: () => setState(() => obscurePassword = !obscurePassword),
        child: Icon(
          obscurePassword
              ? CommunityMaterialIcons.eye_outline
              : CommunityMaterialIcons.eye_off_outline,
          color: COLORS.GREY,
          size: 25,
        ),
      ),
    );
  }

  _buildTextFieldForgotPassword() {
    return WidgetInput(
      // onChanged: (value) => bloc.add(ForgotPasswordChanged(password: value)),
      // errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
      obscureText: obscureForgotPassword,
      focusNode: _forgotPasswordFocusNode,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5,color: Colors.grey)
      ),
      hint: MESSAGES.PASSWORD_HINT,
      endIcon: GestureDetector(
        onTap: () => setState(() => obscureForgotPassword = !obscureForgotPassword),
        child: Icon(
          obscureForgotPassword
              ? CommunityMaterialIcons.eye_outline
              : CommunityMaterialIcons.eye_off_outline,
          color: COLORS.GREY,
          size: 25,
        ),
      ),
    );
  }
  _buildButtonRegister() {
    return WidgetButton(
      // onTap: () => state.status.isValidated ? bloc.add(RegisterFormSubmitted()) : null,
      // enable: state.status.isValidated,
      onTap: (){},
      backgroundColor: COLORS.PRIMARY_COLOR,
      text: MESSAGES.NEXT,
    );
  }
}
