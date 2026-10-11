import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 100.0),
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
                            "RAbeya Akter Lima",
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
                          child: Icon(Icons.person, color: Colors.grey), // Placeholder
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
                              Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                              const SizedBox(width: 12),
                              Text(
                                "Search clothes. . .",
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

                  // Category Filter Chips
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
          ),

          Positioned(
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
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip({required IconData icon, required String label, required bool isSelected}) {
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
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.black87,
              size: 16,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Title
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
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 6),

        // Price & Rating
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
