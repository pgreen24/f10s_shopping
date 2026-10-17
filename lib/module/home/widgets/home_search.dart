import 'package:f10s_shopping/module/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:f10s_shopping/module/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    onPressed: () => Get.back(),
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

                            },
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 11),
                        ),
                        onSubmitted: (value) {
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(

                        children: [
                          const Text(
                            "Recent Searches",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text("Clear All", style: TextStyle(color: Colors.red.shade400, fontSize: 13)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildChip("T-Shirt"),
                          _buildChip("Sneakers"),
                          _buildChip("Smart Watch"),
                          _buildChip("Backpack"),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // --- Trending Section ---
                      const Text(
                        "Trending Right Now",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      _buildTrendingItem(Icons.trending_up, "Winter Jackets Premium"),
                      _buildTrendingItem(Icons.trending_up, "Wireless Bluetooth Earbuds"),
                      _buildTrendingItem(Icons.trending_up, "Minimalist Leather Wallet"),
                    ],
                  ),
                ),
              ),
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

