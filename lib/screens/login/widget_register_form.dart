// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:formz/formz.dart';
import 'package:mobifone/bloc/blocs.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class WidgetRegisterForm extends StatefulWidget {
  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _forgotPasswordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  bool obscurePassword = true;
  bool obscureForgotPassword = true;

  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(() {
      if (!_fullNameFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(FullNameRegisterUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(EmailRegisterUnfocused());
      }
    });
    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(PhoneRegisterUnfocused());
      }
    });
    // _fullNameFocusNode.addListener(() {
    //   if (!_fullNameFocusNode.hasFocus) {
    //     context.read<RegisterBloc>().add(ForgotPasswordRegisterUnfocused());
    //   }
    // });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(PasswordRegisterUnfocused());
      }
    });

  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterBloc.of(context);
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: MESSAGES.SUCCESS,
                onTap1: ()=> AppNavigator.navigateLogout(),
              );
            },
          );
        }
        if (state.status.isSubmissionInProgress) {
          GetSnackBarUtils.createProgress();
        }
        if (state.status.isSubmissionFailure) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MESSAGES.FULL_NAME, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldFullName(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.EMAIL, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldEmail(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldPassword(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.FORGOT_PASSWORD, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldForgotPassword(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.PHONE, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldPhone(bloc),
              AppValue.vSpaceLarge,
              _buildButtonRegister(bloc),
            ],
          ),
        ),
      ),
    );
  }
  _buildButtonRegister(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            onTap: () => state.status.isValidated ? bloc.add(RegisterFormSubmitted()) : null,
            // onTap: () {
            //   ShowDialogCustom.showLoading();
            // },
            enable: state.status.isValidated,
            backgroundColor: COLORS.PRIMARY_COLOR,
            text: MESSAGES.REGISTER,
          );
        }
    );
  }

  _buildTextFieldPassword(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(PasswordRegisterChanged(password: value)),
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

  _buildTextFieldForgotPassword(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(ForgotPasswordRegisterChanged(forgotPassword: value)),
            errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
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
    );
  }

  _buildTextFieldEmail(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return WidgetInput(
          onChanged: (value) => bloc.add(EmailRegisterChanged(email: value)),
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

  _buildTextFieldFullName(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return WidgetInput(
          onChanged: (value) => bloc.add(FullNameRegisterChanged(fullName: value)),
          inputType: TextInputType.text,
          focusNode: _fullNameFocusNode,
          boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1.5,color: Colors.grey)
          ),
          hint: MESSAGES.FULL_NAME_HINT,
          errorText: state.fullName.invalid ? MESSAGES.WARNING_FULL_NAME : null,
        );
      }
    );
  }

  _buildTextFieldPhone(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(PhoneRegisterChanged(phone: value)),
            inputType: TextInputType.phone,
            focusNode: _phoneFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.PHONE,
            errorText: state.phone.invalid ? MESSAGES.WARNING_PHONE_FI : null,
          );
        }
    );
  }
}
