import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobifone/bloc/blocs.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/storages/storages.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  AnimatedLogo({Key? key, required Animation<double> animation}) : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      backgroundColor: COLORS.PRIMARY_COLOR,
      body: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: _sizeTween.evaluate(animation),
              width: _sizeTween.evaluate(animation),
              child: Image.asset(IMAGES.LOGO_APP2)
          ),
        ),
      ),
    );
  }
}
// ignore: use_key_in_widget_constructors
class SplashPage extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}
class _LogoAppState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    //GetLogoBloc.of(context)..add(InitGetLogoEvent());
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context){
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          var firstTime = await shareLocal.getBools(PreferencesKey.FIRST_TIME);
          print('asda: $firstTime');
          if(firstTime == false || firstTime == null)
            _timer = new Timer(const Duration(seconds: 1), () => AppNavigator.navigateLogin());
          else
            _timer = new Timer(const Duration(seconds: 1), () => AppNavigator.navigateMain());
        },
        child: Scaffold(
          body: AnimatedLogo(animation: animation)

        )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}

