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
  final _confirmPassFocusNode =FocusNode();
  final _phoneFocusNode = FocusNode();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    // _fullNameFocusNode.addListener(() {
    //   if (!_fullNameFocusNode.hasFocus) {
    //     context.read<RegisterBloc>().add(FullNameRegisterUnfocused());
    //   }
    // });
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
    _confirmPassFocusNode.addListener(() {
      if (!_confirmPassFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(ConfirmPasswordRegisterUnfocused());
      }
    });
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
    _confirmPassFocusNode.dispose();
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
                content: state.message,
                onTap1: (){
                    print('sdfasdfaaaaaaaaaaa: ${state.email.value}');
                    AppNavigator.navigateLogout();
                }
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
              Text(MESSAGES.EMAIL, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldEmail(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldPassword(bloc),
              AppValue.vSpaceSmall,
              Text('Nhập lại mật khẩu', style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldConfirmPassword(bloc),
              AppValue.vSpaceSmall,
              Text(MESSAGES.PHONE, style: AppStyle.DEFAULT_16_BOLD,),
              AppValue.vSpaceTiny,
              _buildTextFieldPhone(bloc),
              AppValue.vSpaceMedium,
              _buildButtonRegister(bloc),
            ],
          ),
        ),
      ),
    );
  }

  String error = '';
  _buildButtonRegister(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            onTap: (){
              print('tap 1');
              if(passController.text == confirmPassController.text){
                print('tap 2 ${state.email.invalid} ${state.phone.status} ${state.password.status} ${state.passwordCF.status}');

                if(state.status.isValidated){
                  bloc.add(RegisterFormSubmitted());
                }
                else{
                  error = '';
                  if(state.phone.valid == false) error = error + 'Tên tối thiểu 6 ký tự và không quá 60\n';
                  if(state.email.valid == false) error = error + 'Sai định dạng email\n';
                  if(state.password.valid == false) error = error + MESSAGES.PASSWORD_ERROR;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WidgetDialog(
                        title: MESSAGES.NOTIFICATION,
                        content: error,
                      );
                    },
                  );
                }
                // state.status.isValidated ? bloc.add(RegisterFormSubmitted(referralController.text)) : showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return WidgetDialog(
                //       title: MESSAGES.NOTIFICATION,
                //       content: MESSAGES.CHECK_INFOMATION,
                //     );
                //   },
                // );
              }
              else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: MESSAGES.CHECK_COMFIRM_PASS,
                    );
                  },
                );
              }

            },
            //  onTap: () =>
            //    AppNavigator.navigateVerifyRegister()
            //  ,
            enable: state.status.isValidated,
            backgroundColor: COLORS.PRIMARY_COLOR,
            text: MESSAGES.REGISTER.toUpperCase(),
          );
        }
    );
  }

  String? errorPass;
  _buildTextFieldPassword(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) {
              bloc.add(PasswordRegisterChanged(password: value));
              // if(value.length < 4)
              //   setState(() {
              //     errorPass = 'Độ dài tối thiểu 8 ký tự';
              //   });
              // else
                if(value.length > 60)
                setState(() {
                  errorPass = 'Độ dài tối đa 60 ký tự';
                });
              else if(value.contains(RegExp(r'[/\s]')) == true)
                setState(() {
                  errorPass = 'Mật khẩu không được chứa dấu cách';
                });
              else setState(() {
                  errorPass = null;
                });
            },
            errorText: errorPass,
            obscureText: obscurePassword,
            focusNode: _passwordFocusNode,
            inputController: passController,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                color: COLORS.WHITE
            ),
            hint: MESSAGES.PASSWORD_HINT,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscurePassword = !obscurePassword),
              child: Image.asset(
                !obscurePassword
                    ? ICONS.HINT_ICON
                    : ICONS.HINT_PASS,
                color: COLORS.GREY,
                height: 25,width: 25,
              ),
            ),
          );
        }
    );
  }


  String? errorConfirm;
  _buildTextFieldConfirmPassword(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) {
              bloc.add(ConfirmPasswordRegisterChanged(passwordCF: value));
              if(value.contains(RegExp(r'[/\s]')) == true)
                setState(() {
                  errorConfirm = 'Mật khẩu không được chứa dấu cách';
                });
              else
              if(value != state.password.value){
                setState(() {
                  errorConfirm = 'Mật khẩu không trùng khớp';
                });
              }
              else{
                setState(() {
                  errorConfirm = null;
                });
              }

            },
            errorText: errorConfirm,
            obscureText: obscureConfirmPassword,
            focusNode: _confirmPassFocusNode,
            inputController: confirmPassController,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                color: COLORS.WHITE
            ),
            hint: MESSAGES.CONFIRM_PASSWORD,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
              child: Image.asset(
                !obscureConfirmPassword
                    ? ICONS.HINT_ICON
                    : ICONS.HINT_PASS,
                color: COLORS.GREY,
                height: 25,width: 25,
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
            errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
            inputType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                color: COLORS.WHITE
            ),
            hint: MESSAGES.EMAIL_HINT,
            // errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
        }
    );
  }

  // _buildTextFieldFullName(RegisterBloc bloc) {
  //   return BlocBuilder<RegisterBloc, RegisterState>(
  //     builder: (context, state) {
  //       return WidgetInput(
  //         onChanged: (value) => bloc.add(FullNameRegisterChanged(fullName: value)),
  //         inputType: TextInputType.text,
  //         focusNode: _fullNameFocusNode,
  //         boxDecoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             border: Border.all(width: 1.5,color: Colors.grey)
  //         ),
  //         hint: MESSAGES.FULL_NAME_HINT,
  //         errorText: state.fullName.invalid ? MESSAGES.WARNING_FULL_NAME : null,
  //       );
  //     }
  //   );
  // }

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
