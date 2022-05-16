import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';


class ChangeInformation extends StatefulWidget {
  const ChangeInformation({Key? key}) : super(key: key);

  @override
  State<ChangeInformation> createState() => _ChangeInformationState();
}

class _ChangeInformationState extends State<ChangeInformation> {

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
    return Scaffold(
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
                children: [
                  AspectRatio(
                    aspectRatio: 3.8,
                    child: image != null  ? Center(
                      child: ClipOval(
                        child: Image.file(
                          image!,
                          width: 100,height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        :  CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/imge_1.jpg'),
                    ),
                  ),
                  Positioned(
                      left: AppValue.widths*0.55, top: AppValue.heights*0.1,
                      child: Image.asset('assets/icons/mayanh.png'))
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
              height: AppValue.heights*0.4,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                ],
              ),
            ),
            WidgetButton(
              onTap: (){},
              textColor: Colors.white,text: MESSAGES.SAVE,
              padding: EdgeInsets.symmetric(horizontal: 15),
            )
          ],
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
  _buildTextForm(String initialValue,
      {bool enabled = true,
        FocusNode? focusNode,
        GestureTapCallback? onTap,
        TextEditingController? controller}){
    return GestureDetector(
      onTap: onTap,
      child: WidgetInput(
        // onChanged: null,
        initialValue: initialValue,
        focusNode: focusNode,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1.5,color: Colors.grey)
        ),
      ),
    );
  }
}

