import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/apps_color.dart';
import 'shimmer_logic.dart';

class ShimmerPage extends GetView<ShimmerLogic> {
  const ShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppsColor.white,
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 110.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: 90, height: 12, color: Colors.grey.shade400),
                            const SizedBox(height: 6),
                            Container(width: 150, height: 18, color: Colors.black),
                          ],
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search, size: 20, color: Colors.black),
                                const SizedBox(width: 12),
                                Container(width: 110, height: 10, color: Colors.grey.shade400),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.tune, color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.grid_view, color: Colors.white, size: 16),
                                const SizedBox(width: 6),
                                Container(width: 60, height: 10, color: Colors.white),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.checkroom, color: Colors.black, size: 16),
                                const SizedBox(width: 6),
                                Container(width: 60, height: 10, color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 16),
                                const SizedBox(width: 6),
                                Container(width: 60, height: 10, color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(Icons.accessibility, color: Colors.black, size: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildProductCard(imageHeight: 320, hasStar: true),
                              const SizedBox(height: 16),
                              _buildProductCard(imageHeight: 250, hasStar: false),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              _buildProductCard(imageHeight: 290, hasStar: false),
                              const SizedBox(height: 16),
                              _buildProductCard(imageHeight: 150, hasStar: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: Container(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: AppsColor.black,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.home_filled, color: Colors.white, size: 24),
                      const SizedBox(height: 4),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      const Icon(Icons.shopping_bag_outlined, color: Colors.white60, size: 24),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.favorite_border, color: Colors.white60, size: 24),
                  const Icon(Icons.person_outline, color: Colors.white60, size: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({required double imageHeight, required bool hasStar}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: imageHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(12),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite_border, color: Colors.white, size: 16),
          ),
        ),
        const SizedBox(height: 10),

        Container(width: double.infinity, height: 12, color: Colors.black),
        const SizedBox(height: 6),

        Container(width: 60, height: 10, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(width: 45, height: 12, color: Colors.grey.shade600),

            hasStar
                ? Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Container(width: 20, height: 10, color: Colors.black),
              ],
            )
                : Container(width: 30, height: 10, color: Colors.black),
          ],
        ),
      ],
    );
  }
}