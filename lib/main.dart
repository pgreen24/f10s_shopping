import 'package:f10s_shopping/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F10S Shopping',
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
       defaultTransition: Transition.fade,
    );
  }
}
