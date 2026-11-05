import 'package:f10s_shopping/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('F10S_Storage');
  ResponsiveSizingConfig.instance.setCustomBreakpoints(const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200));
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
