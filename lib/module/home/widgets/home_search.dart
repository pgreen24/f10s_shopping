import 'package:f10s_shopping/module/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_product_details.dart';

class HomeSearch extends GetView<HomeLogic> {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
                    onPressed: () {
                      controller.searchQuery.value = '';
                      Get.back();
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: 46,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        autofocus: true,
                        style: const TextStyle(fontSize: 15, color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: "Search for products, brands...",
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.cancel, color: Colors.grey.shade400, size: 18),
                            onPressed: () {
                              controller.searchQuery.value = '';
                            },
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 11),
                        ),
                        onChanged: (value) {
                          controller.searchQuery.value = value.trim();
                        },
                        onSubmitted: (value) {
                          controller.searchQuery.value = value.trim();
                        },
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                // ১. যদি সার্চ কুয়েরি খালি থাকে, তবে প্রোডাক্ট লিস্ট দেখাবে না
                if (controller.searchQuery.value.isEmpty) {
                  return const Center(
                    child: Text("Search for your favorite products!", style: TextStyle(color: Colors.grey)),
                  );
                }

                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.filteredProducts.isEmpty) {
                  return const Center(
                    child: Text("No products found!", style: TextStyle(color: Colors.grey)),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.filteredProducts[index];
                    return ListTile(
                      leading: Image.network(
                        product.thumbnail ?? '',
                        width: 50,
                        height: 50,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image),
                      ),
                      title: Text(product.title ?? ''),
                      subtitle: Text("\$${product.price ?? '0'}"),
                      onTap: () {
                        Get.to(() => const HomeProductDetails(), arguments: product);
                      },
                    );
                  },
                );
              }),
            ),





          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
      ),
    );
  }

  Widget _buildTrendingItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.orange, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
      trailing: const Icon(Icons.north_west, color: Colors.grey, size: 16),
      onTap: () {
        // ট্রেন্ডিং আইটেম ক্লিক লজিক
      },
    );
  }
}

