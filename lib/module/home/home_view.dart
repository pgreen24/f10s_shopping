import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f10s_shopping/module/home/widgets/home_cart.dart';
import 'package:f10s_shopping/module/home/widgets/home_navigation.dart';
import 'package:f10s_shopping/module/home/widgets/home_product_details.dart';
import 'package:f10s_shopping/module/home/widgets/home_product_model.dart';
import 'package:f10s_shopping/module/home/widgets/home_profile.dart';
import 'package:f10s_shopping/module/home/widgets/home_search.dart';
import 'package:f10s_shopping/module/home/widgets/home_wishlist.dart';

import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeLogic());
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
            // Top Welcome Header
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
                    Obx(
                      () => Text(
                        controller.userName.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.changePage(3),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        image: controller.userImageUrl.isEmpty
                            ? null
                            : DecorationImage(
                                image: NetworkImage(
                                  controller.userImageUrl.value,
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: controller.userImageUrl.isEmpty
                          ? const Icon(Icons.person, color: Colors.grey)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search and Filter Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.to(() => const HomeSearch()),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Search...",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

            // Dynamic Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                    () => Row(
                  children: [
                    _buildCategoryChip(label: "All Items", categoryKey: "all"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Smartphones", categoryKey: "smartphones"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Mobile Accessories", categoryKey: "mobile-accessories"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Beauty", categoryKey: "beauty"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Fragrances", categoryKey: "fragrances"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Furniture", categoryKey: "furniture"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Groceries", categoryKey: "groceries"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Laptops", categoryKey: "laptops"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Home-Decoration", categoryKey: "home-decoration"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Kitchen Accessories", categoryKey: "kitchen-accessories"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Mens Shirts", categoryKey: "mens-shirts"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Mens Shoes", categoryKey: "mens-shoes"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Mens Watches", categoryKey: "mens-Watches"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Motorcycle", categoryKey: "motorcycle"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: " Skin Care", categoryKey: "skin-care"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: " Sports Accessories", categoryKey: "sports-accessories"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: " Sunglasses", categoryKey: "sunglasses"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Tablets", categoryKey: "tablets"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Tops", categoryKey: "tops"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Vehicle", categoryKey: "vehicle"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Womens Bags", categoryKey: "womens-bags"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Womens Dresses", categoryKey: "womens-dresses"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Womens Shoes", categoryKey: "womens-shoes"),
                    const SizedBox(width: 10),
                    _buildCategoryChip(label: "Womens Watches", categoryKey: "womens-watches"),



                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Dynamic Product Grid with Loading Indicator
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: CircularProgressIndicator(color: Colors.black87),
                  ),
                );
              }

              List<ProductModel> productsToShow = controller.filteredProducts;

              if (productsToShow.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "No products found!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productsToShow.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  return _buildProductCard(productsToShow[index]);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required String categoryKey,
  }) {
    bool isSelected = controller.selectedCategory.value == categoryKey;
    return GestureDetector(
      onTap: () => controller.changeCategory(categoryKey),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    final productData = {
      'title': product.title,
      'category': product.category,
      'price': product.price,
      'rating': product.rating,
      'thumbnail': product.thumbnail,
    };

    return InkWell(
      onTap: () => Get.to(() => const HomeProductDetails(), arguments: product),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade100),
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.contain,
                ),
              ),
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () => controller.toggleWishlist(productData ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Obx(() {
                    final isFav = controller.isFavorite(product.title);
                    return Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.black87,
                      size: 16,
                    );
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            product.category.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price.toStringAsFixed(2)}",
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
                    product.rating.toString(),
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
      ),
    );
  }
}
