import 'package:f10s_shopping/module/sign_in/sign_in_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../utils/keyboard.dart';
import 'login_Screen/logIn_tablet.dart';
import 'login_Screen/login_mobile.dart';
import 'login_logic.dart';


class LoginView  extends StatelessWidget {
  const LoginView ({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LoginLogic>();
    return GestureDetector(
      onTap: () => Keyboard.close(context: context),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            ScreenTypeLayout.builder(
              mobile: (BuildContext context) => OrientationLayoutBuilder(
                portrait: (BuildContext context) => LoginMobile(),
                landscape: (BuildContext context) => LoginMobile(),
              ),
              tablet: (BuildContext context) => OrientationLayoutBuilder(
                portrait: (BuildContext context) => LoginTablet(),
                landscape: (BuildContext context) => LoginTablet(),
              ),
            ),
      ),
    );
  }
}


