import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

import '../../../../../bloc/change_info/info_change_bloc.dart';
import '../../../../../storages/share_local.dart';


class ChangeInformation extends StatefulWidget {

   const ChangeInformation({Key? key}) : super(key: key);

  @override
  State<ChangeInformation> createState() => _ChangeInformationState();
}

class _ChangeInformationState extends State<ChangeInformation> {
  // int id = Get.arguments[0];
  late LoginData data;

  final _fullNameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(() {
      if (!_fullNameFocusNode.hasFocus) {
        context.read<InfoChangeBloc>().add(FullNameUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<InfoChangeBloc>().add(EmailInfoUnfocused());
      }
    });
    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        context.read<InfoChangeBloc>().add(PhoneInfoUnfocused());
      }
    });
    _dateFocusNode.addListener(() {
      if (!_dateFocusNode.hasFocus) {
        context.read<InfoChangeBloc>().add(DateInfoUnfocused());
      }
    });
    loadUser();
  }
  loadUser()async{
    final response = await shareLocal.getString(PreferencesKey.USER);
    if(response!=null)
    {
      setState(() {
        data=LoginData.fromJson(jsonDecode(response)['data']);
      });
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _fullNameFocusNode.dispose();
    super.dispose();
  }

  File? image;

  Future getImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e){
      print('Error: $e');
    }
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e){
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = InfoChangeBloc.of(context);
    return BlocListener<InfoChangeBloc, InfoChangeState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateInformationAccount();
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(MESSAGES.CHANGE_INFORMATION,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
          backgroundColor: COLORS.PRIMARY_COLOR,
          elevation: 0,
          leading: _buildBack(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppValue.vSpaceSmall,
              GestureDetector(
                onTap: (){
                  showCupertinoModalPopup(
                      context: Get.context!,
                      builder: (context)
                      => CupertinoActionSheet(
                          title: Text('Ảnh đại diện'),
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('Huỷ'),
                            onPressed: () {
                              AppNavigator.navigateBack();
                            },
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () async {
                                getImage();
                              },
                              child: Text('Chọn ảnh có sẵn'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () async {
                                getImageCamera();
                              },
                              child: Text('Chụp ảnh mới'),)
                          ]));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    image != null  ? ClipOval(
                      child: Image.file(
                        image!,
                        width: AppValue.widths*0.4,height: AppValue.heights*0.21,
                        fit: BoxFit.cover,
                      ),
                    )
                        :  CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(data.avatar!),
                    ),
                    Positioned(
                        left: AppValue.widths*0.25, top: AppValue.heights*0.15,
                        child: Image.asset('assets/icons/camera.png',height: 60,width: 60,))
                  ],
                ),
              ),
              // Stack(
              //   children: [
              //     AspectRatio(
              //       aspectRatio: 3.8,
              //       child: CircleAvatar(
              //         // radius: 20,
              //         backgroundImage: AssetImage('assets/images/img-1.png'),
              //       ),
              //     ),
              //     Positioned(
              //         left: AppValue.widths*0.55, top: AppValue.heights*0.1,
              //         child: CircleAvatar(
              //             radius: 12,
              //             backgroundColor: COLORS.GREY,
              //             child: SvgPicture.asset('assets/icons/mayanh.svg'))),
              //   ],
              // ),
              Container(
                height: AppValue.heights*0.5,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTextFieldFullName(bloc),
                    _buildTextFieldPhone(bloc),
                    _buildTextFieldEmail(bloc),
                    _buildTextFieldDate(bloc),
                    _buildButtonSave(bloc),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _buildBack() {
    return IconButton(
      onPressed: () {
        AppNavigator.navigateBack();
      },
      icon: Image.asset(
        ICONS.ICON_BACK,
        height: 28,
        width: 28,
        color: COLORS.WHITE,
      ),
    );
  }
  _buildTextFieldPhone(InfoChangeBloc bloc) {
    return BlocBuilder<InfoChangeBloc, InfoChangeState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(PhoneInfoChanged(phone: value)),
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
  _buildTextFieldDate(InfoChangeBloc bloc) {
    return BlocBuilder<InfoChangeBloc, InfoChangeState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(DateInfoChanged(date_or_birth: value)),
            inputType: TextInputType.datetime,
            focusNode: _dateFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.BIRTHDAY,
            errorText: state.date_or_birth.invalid ? MESSAGES.WARNING_PHONE_FI : null,
          );
        }
    );
  }
  _buildTextFieldEmail(InfoChangeBloc bloc) {
    return BlocBuilder<InfoChangeBloc, InfoChangeState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(EmailInfoChanged(email: value)),
            inputType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.EMAIL,
            errorText: state.email.invalid ? MESSAGES.WARNING_PHONE_FI : null,
          );
        }
    );
  }
  _buildTextFieldFullName(InfoChangeBloc bloc) {
    return BlocBuilder<InfoChangeBloc, InfoChangeState>(
        builder: (context, state) {
          return WidgetInput(
            onChanged: (value) => bloc.add(FullNameChanged(fullname: value)),
            inputType: TextInputType.text,
            focusNode: _fullNameFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.5,color: Colors.grey)
            ),
            hint: MESSAGES.FULL_NAME,
            errorText: state.fullname.invalid ? MESSAGES.WARNING_PHONE_FI : null,
          );
        }
    );
  }
  _buildButtonSave(InfoChangeBloc bloc) {
    return BlocBuilder<InfoChangeBloc, InfoChangeState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
              onTap: (){
                // AppNavigator.navigateMain();
                state.status.isValidated ? bloc.add(InfoFormSubmitted())
                    : showDialog(
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
              text: MESSAGES.SAVE
          );
        }
    );
  }
}

