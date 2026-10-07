import 'package:f10s_shopping/module/splash/splash_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/apps_color.dart';

class SplashScreen  extends GetView<SplashLogic>{
  const SplashScreen ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppsColor.mainColor,
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppsColor.grey,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 48,
                    color: AppsColor.secondMain,
                  ),
                ),


                const SizedBox(height: 28),
                Text(
                  "F10s Shopping",
                  style: TextStyle(
                    color: AppsColor.secondMain,
                    fontSize: 15.14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your Favourites, All in one place.",
                  style: TextStyle(
                    color: AppsColor.darkerGrey,
                    fontSize: 10.14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),

                SizedBox(
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      minHeight: 4,
                      backgroundColor: Color(0xFFE0E0E0),
                      valueColor: AlwaysStoppedAnimation<Color>(AppsColor.black),
                    ),
                  ),
                ),
                const Text(
                  "Loading...",
                  style: TextStyle(
                    color: AppsColor.darkerGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}