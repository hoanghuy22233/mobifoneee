import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mobifone/bloc/blocs.dart';
import 'package:mobifone/screens/forgot_password/index.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailFocusNode = FocusNode();

  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<ForgotPasswordBloc>().add(EmailForgotPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ForgotPasswordBloc.of(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
          child: WidgetTouchHideKeyBoard(
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
                      Text('Quên mật khẩu',style: AppStyle.DEFAULT_16_BOLD,),
                      AppValue.vSpaceTiny,
                      Text('Vui lòng nhập email đăng ký tài khoản',style: AppStyle.DEFAULT_14,),
                      AppValue.vSpaceMedium,
                      _buildTextFieldEmail(bloc),
                      AppValue.vSpaceMedium,
                      _buildNext(bloc)
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
  _buildTextFieldEmail(ForgotPasswordBloc bloc) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(EmailForgotPasswordChanged(email: value)),
            inputType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.EMAIL_HINT,
            errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
        }
    );
  }
  _buildNext(ForgotPasswordBloc bloc) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            onTap: () => state.status.isValidated ? bloc.add(FormForgotPasswordSubmitted()) : AppNavigator.navigateForgotPasswordOTP(state.email.value.toString()),
            // enable: state.status.isValidated,
            // onTap: ()=> state.status.isValidated
            //     ? bloc.add(FormForgotPasswordSubmitted())
            //     : showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return WidgetDialog(
            //       title: MESSAGES.NOTIFICATION,
            //       content: 'Vui lòng kiểm tra lại email',
            //     );
            //   },
            // ),
            backgroundColor: COLORS.PRIMARY_COLOR,
            text: MESSAGES.NEXT,
          );
        }
    );
  }
}
