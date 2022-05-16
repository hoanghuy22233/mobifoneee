
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobifone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobifone/bloc/blocs.dart';
import '../../src/src_index.dart';


class ForgotPasswordOTPScreen extends StatefulWidget {

  @override
  ForgotPasswordOTPScreenState createState() => ForgotPasswordOTPScreenState();
}

class ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
  final _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _otpFocusNode.addListener(() {
      if (!_otpFocusNode.hasFocus) {
        context.read<ForgotPasswordOTPBloc>().add(OtpCodeForgotPasswordOTPUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ForgotPasswordOTPBloc.of(context);
    return BlocListener<ForgotPasswordOTPBloc, ForgotPasswordOTPState>(
      listener: (context, state){
        // if (state.status.isSubmissionSuccess) {
        //   GetSnackBarUtils.removeSnackBar();
        //   AppNavigator.navigateForgotPasswordReset(state);
        // }
        // if (state.status.isSubmissionInProgress) {
        //   GetSnackBarUtils.createProgress();
        // }
        // if (state.status.isSubmissionFailure) {
        //   GetSnackBarUtils.removeSnackBar();
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return WidgetDialog(
        //         title: MESSAGES.NOTIFICATION,
        //         content: state.message,
        //       );
        //     },
        //   );
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        backgroundColor: Colors.white,
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
                        Text('Nhập mã Otp',style: AppStyle.DEFAULT_16_BOLD,),
                        AppValue.vSpaceTiny,
                        Text('Vui lòng nhập mã Otp được gửi đến email của bạn',style: AppStyle.DEFAULT_14,),
                        AppValue.vSpaceMedium,
                        _buildTextFieldOtp(bloc),
                        AppValue.vSpaceMedium,
                        _buildButtonForgotPasswordOTPVerify(bloc),
                      ],
                    ),
                  )
              ),
            )
        ),
      )
      );
  }

  }
  _buildTextFieldOtp(ForgotPasswordOTPBloc bloc) {
    return BlocBuilder<ForgotPasswordOTPBloc, ForgotPasswordOTPState>(
        builder: (context, state) {
          return WidgetInput(
            // onChanged: (value) => bloc.add(OtpCodeForgotPasswordOTPChanged(otp: value)),
            onChanged: (value)=> AppNavigator.navigateForgotPasswordReset(),
            inputType: TextInputType.number,
            // focusNode: _otpFocusNode,
            // focusNode: _emailFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.OTP_CODE,
            errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
        }
    );
  }
  _buildButtonForgotPasswordOTPVerify(ForgotPasswordOTPBloc bloc) {
    return BlocBuilder<ForgotPasswordOTPBloc, ForgotPasswordOTPState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            // onTap: () => state.status.isValidated ? bloc.add(RegisterFormSubmitted()) : null,
            // enable: state.status.isValidated,
            onTap: (){AppNavigator.navigateForgotPasswordReset();},
            backgroundColor: COLORS.PRIMARY_COLOR,
            text: MESSAGES.NEXT,
          );
        }
    );
  }

