import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_logic.dart';

class CustomBottomBar extends GetView<HomeLogic> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(

                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(icon: Icons.home_filled, index: 0),
              _buildNavItem(icon: Icons.shopping_bag_outlined, index: 1),
              _buildNavItem(icon: Icons.favorite_border, index: 2),
              _buildNavItem(icon: Icons.person_outline, index: 3),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () => controller.changePage(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: controller.currentIndex.value == index ? Colors.white : Colors.white60,
            size: 24,
          ),
          const SizedBox(height: 4),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: controller.currentIndex.value == index ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
