import 'package:f10s_shopping/module/sign_in/sign_in_Screen/sign_in_mobile.dart';
import 'package:f10s_shopping/module/sign_in/sign_in_Screen/sign_in_tablet.dart';
import 'package:f10s_shopping/module/sign_in/sign_in_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../utils/keyboard.dart';


class SignInView  extends GetView<SignInLogic> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.find<SignInLogic>();
    Get.lazyPut(()=>SignInLogic());
    return GestureDetector(
      onTap: () => Keyboard.close(context: context),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            ScreenTypeLayout.builder(
              mobile: (BuildContext context) => OrientationLayoutBuilder(
                portrait: (BuildContext context) => SignInMobile(),
                landscape: (BuildContext context) => SignInMobile(),
              ),
              tablet: (BuildContext context) => OrientationLayoutBuilder(
                portrait: (BuildContext context) => SignInTablet(),
                landscape: (BuildContext context) => SignInTablet(),
              ),
            ),
      ),
    );
  }
}

