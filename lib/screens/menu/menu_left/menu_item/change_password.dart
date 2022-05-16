import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_input.dart';

class ChangePassWordPage extends StatefulWidget {
  const ChangePassWordPage({Key? key}) : super(key: key);

  @override
  State<ChangePassWordPage> createState() => _ChangePassWordPageState();
}

class _ChangePassWordPageState extends State<ChangePassWordPage> {

  bool obscurePassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  final _newPasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPassFocusNode =FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.CHANGE_PASSWORD,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Container(
        height: AppValue.heights*0.45,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextField('Mật khẩu hiện tại',
              obscureText: obscurePassword,
              focusNode: _passwordFocusNode,
              endIcon: GestureDetector(
                onTap: () => setState(() => obscurePassword = !obscurePassword),
                child: Image.asset(
                  obscurePassword
                      ? ICONS.HINT_PASS
                      : ICONS.HINT_ICON,
                  color: COLORS.GREY,
                  height: 25,width: 25,
                ),
              ),
            ),
            _buildTextField('Mật khẩu mới',
              obscureText: obscureNewPassword,
              focusNode: _newPasswordFocusNode,
              endIcon: GestureDetector(
                onTap: () => setState(() => obscureNewPassword = !obscureNewPassword),
                child: Image.asset(
                  obscureNewPassword
                      ? ICONS.HINT_PASS
                      : ICONS.HINT_ICON,
                  color: COLORS.GREY,
                  height: 25,width: 25,
                ),
              ),
            ),
            _buildTextField('Nhập lại mật khẩu',
              obscureText: obscureConfirmPassword,
              focusNode: _confirmPassFocusNode,
              endIcon: GestureDetector(
                onTap: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
                child: Image.asset(
                  obscureConfirmPassword
                      ? ICONS.HINT_PASS
                      : ICONS.HINT_ICON,
                  color: COLORS.GREY,
                  height: 25,width: 25,
                ),
              ),
            ),
            SizedBox(),
            WidgetButton(
              onTap: (){AppNavigator.navigateMain();},
              height: 45,padding: EdgeInsets.all(0),
              backgroundColor: COLORS.SECONDS_COLOR,
              text: 'Hoàn thành',textColor: Colors.white,
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
  _buildTextField(String hintText,
      {bool enabled = true,
        Widget? endIcon,
        bool? obscureText,
        FocusNode? focusNode,
        GestureTapCallback? onTap,
        TextEditingController? controller}) {
    return GestureDetector(
      onTap: onTap,
      child: WidgetInput(
        height: 50,
        endIcon: endIcon,
        obscureText: obscureText,
        inputController: controller,
        enabled: enabled,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1,color: COLORS.GREY.withOpacity(0.8))
        ),
        inputType: TextInputType.text,
        focusNode: focusNode,
        hint: hintText,
      ),
    );
  }
}
