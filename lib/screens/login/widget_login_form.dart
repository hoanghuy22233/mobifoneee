// ignore: import_of_legacy_library_into_null_safe
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:formz/formz.dart';
import 'package:mobifone/bloc/blocs.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class WidgetLoginForm extends StatefulWidget {

  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool obscurePassword = true;
  late LoginData user;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginBloc>().add(EmailUnfocused());
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateMain();
        }
        if (state.status.isSubmissionInProgress) {
          GetSnackBarUtils.createProgress();
        }
        if (state.status.isSubmissionFailure) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
              );
            },
          );

          //GetSnackBarUtils.createFailure(message: state.message);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MESSAGES.EMAIL, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldUsername(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldPassword(bloc),
              AppValue.vSpaceSmall,
              _buildForgotPassword(),
              AppValue.vSpaceMedium,
              _buildButtonLogin(bloc),
            ],
          ),
        ),
      ),
    );
  }

  _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => AppNavigator.navigateForgotPassword(),
        child: Text(
          MESSAGES.FORGOT_PASSWORD + "?",
          style: AppStyle.DEFAULT_14,
        ),
      ),
    );
  }

  _buildButtonLogin(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
              onTap: (){
                // AppNavigator.navigateMain();
                state.status.isValidated ? bloc.add(FormSubmitted()) : showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: 'Kiểm tra lại thông tin',
                    );
                  },
                );
              },
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: COLORS.PRIMARY_COLOR,
              ),
              enable: state.status.isValidated,
              textStyle: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600),
              text: MESSAGES.LOGIN
          );
        }
    );
  }

  _buildTextFieldPassword(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(PasswordChanged(password: value)),
            errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
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
    );
  }

  _buildTextFieldUsername(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return WidgetInput(
          onChanged: (value) => bloc.add(EmailChanged(email: value)),
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
}
