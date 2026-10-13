import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_logic.dart';

class HomeProfile extends GetView<HomeLogic> {
  const HomeProfile ({super.key});


  @override
  Widget build (BuildContext context){
    return Material(
      child: SafeArea(
        child: Column(
          children: [

            Expanded(
              child:SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 170.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRoundButton(Icons.arrow_back_ios_new, () {
                          controller.changePage(2);
                        }),
                        Column(
                          children: [
                            const Text(
                              "Account Profile",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        _buildRoundButton(Icons.more_horiz, () {}),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRoundButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Icon(icon, color: Colors.black, size: 18),
      ),
    );
  }
}
