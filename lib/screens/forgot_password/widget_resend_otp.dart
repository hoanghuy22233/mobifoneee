import 'package:mobifone/bloc/blocs.dart';
import 'package:mobifone/src/get_snack_bar_utils.dart';
import 'package:mobifone/src/messages.dart';
import 'package:mobifone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class WidgetResendOTP extends StatefulWidget {
  final String type;
  const WidgetResendOTP({Key? key, required this.type}) : super(key: key);


  @override
  _WidgetResendOTPState createState() =>
      _WidgetResendOTPState();
}

class _WidgetResendOTPState extends State<WidgetResendOTP> {
  late ResendOTPBloc resendOTPBloc;

  @override
  void initState() {
    super.initState();
    resendOTPBloc = BlocProvider.of<ResendOTPBloc>(context)..add(TimeInit(time: Duration(seconds: 60)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOTPBloc, ResendOTPState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          //await GetSnackBarUtils.createSuccess(message: state.message);
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
                onTap1: (){
                  Get.back();
                  setState(() {
                    BlocProvider.of<ResendOTPBloc>(context).add(TimeInit(time: Duration(seconds: 60)));
                  });

                },
              );
            },
          );

        }
        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ResendOTPBloc, ResendOTPState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Center(
                child: WidgetResend(
                  onTap: () => BlocProvider.of<ResendOTPBloc>(context).add(ResendOTPSubmit(widget.type)),
                  time: state.time,
                  isValid: isResendEnabled(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool isResendEnabled() {
    return resendOTPBloc.state.isFormValid &&
        !resendOTPBloc.state.isSubmitting;
  }
}
