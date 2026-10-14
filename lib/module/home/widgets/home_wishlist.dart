import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_logic.dart';

class HomeWishlist extends GetView<HomeLogic> {
  const HomeWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRoundButton(Icons.arrow_back_ios_new, () {
                    controller.changePage(0);
                  }),
                  const Text(
                    "Wishlist",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _buildRoundButton(Icons.linear_scale, () {}),
                ],
              ),
            ),
            const SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your favourites",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Obx(() => Text(
                    "${controller.wishlistItems.length} saved items. Keep them close for later.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: Obx(() {
                if (controller.wishlistItems.isEmpty) {
                  return const Center(
                    child: Text(
                      "Your wishlist is empty!",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: controller.wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.wishlistItems[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // প্রডাক্ট ইমেজ প্লেসহোল্ডার বক্স
                          Container(
                            width: 100,
                            height: 135,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // প্রডাক্টের ডিটেইলস এবং বাটন সেকশন
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title'] ?? '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            item['category'] ?? '', // স্ক্রিনশটের White - Size M এর মতো ক্যাটাগরি টেক্সট
                                            style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // গোল আকৃতির রিমুভ (x) বাটন
                                    GestureDetector(
                                      onTap: () => controller.toggleWishlist(item),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.close, size: 14, color: Colors.grey.shade700),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['price'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // "Add to cart"
                                GestureDetector(
                                  onTap: () => controller.addToCartFromWishlist(item),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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


