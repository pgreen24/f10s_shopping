import 'package:f10s_shopping/module/home/widgets/home_cart.dart';
import 'package:f10s_shopping/module/home/widgets/home_navigation.dart';
import 'package:f10s_shopping/module/home/widgets/home_profile.dart';
import 'package:f10s_shopping/module/home/widgets/home_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeBody(),
      const HomeCart(),
      const HomeWishlist(),
      const HomeProfile(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => pages[controller.currentIndex.value]),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget _buildHomeBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 16.0,
          bottom: 100.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello, Welcome",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text("👋", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Rabeya Akter Lima",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: const ClipOval(
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Search ",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip(
                    icon: Icons.grid_view,
                    label: "All Items",
                    isSelected: true,
                  ),
                  const SizedBox(width: 10),
                  _buildCategoryChip(
                    icon: Icons.smartphone,
                    label: "Phone",
                    isSelected: false,
                  ),
                  const SizedBox(width: 10),
                  _buildCategoryChip(
                    icon: Icons.shopping_bag_outlined,
                    label: "T-Shirt",
                    isSelected: false,
                  ),
                  const SizedBox(width: 10),
                  _buildCategoryChip(
                    icon: Icons.accessibility_new,
                    label: "Pants",
                    isSelected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildProductCard(
                        imageHeight: 240,
                        title: "Modern Light Clothes",
                        category: "T-Shirt",
                        price: "\$212.99",
                        rating: "5.0",
                      ),
                      const SizedBox(height: 16),
                      _buildProductCard(
                        imageHeight: 180,
                        title: "Classic Winter Hat",
                        category: "Accessories",
                        price: "\$95.00",
                        rating: "4.8",
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildProductCard(
                        imageHeight: 290,
                        title: "Light Dress Bless",
                        category: "Dress modern",
                        price: "\$162.99",
                        rating: "5.0",
                      ),
                      const SizedBox(height: 16),
                      _buildProductCard(
                        imageHeight: 150,
                        title: "Summer Casual",
                        category: "Dress",
                        price: "\$120.50",
                        rating: "4.9",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black87,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required double imageHeight,
    required String title,
    required String category,
    required String price,
    required String rating,
  }) {
    final productData = {
      'title': title,
      'category': category,
      'price': price,
      'rating': rating,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: imageHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () {

              controller.toggleWishlist(productData);
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Obx(() {
                final isFav = controller.isFavorite(title);
                return Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.black87,
                  size: 16,
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          category,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
