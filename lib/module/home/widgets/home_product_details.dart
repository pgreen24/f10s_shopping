import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f10s_shopping/module/home/home_logic.dart';

import 'home_product_model.dart';

class HomeProductDetails extends GetView<HomeLogic> {
  const HomeProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    final productData = {
      'title': product.title,
      'category': product.category,
      'price': product.price,
      'rating': product.rating,
      'thumbnail': product.thumbnail ?? '',
    };

    RxInt quantity = 1.obs;


    double originalPrice =
        product.price / (1 - (product.discountPercentage / 100));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Header
              Stack(
                children: [
                  Container(
                    height: 420,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product.thumbnail),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                              size: 18,
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.toggleWishlist(productData),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Obx(() {
                              final isFav = controller.isFavorite(
                                product.title,
                              );
                              return Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.black87,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Product Info Body
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand Name
                    if (product.brand.isNotEmpty)
                      Text(
                        product.brand.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    const SizedBox(height: 4),

                    // Title and Quantity Selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                onPressed: () {
                                  if (quantity.value > 1) quantity.value--;
                                },
                              ),
                              Obx(
                                () => Text(
                                  '${quantity.value}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                onPressed: () => quantity.value++,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Rating & Stock status
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: product.stock > 10
                                ? Colors.green.shade50
                                : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            product.availabilityStatus,
                            style: TextStyle(
                              color: product.stock > 10
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Description
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.description,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Warranty & Shipping Badges
                    Row(
                      children: [
                        _buildInfoBadge(
                          Icons.verified_user_outlined,
                          product.warrantyInformation,
                        ),
                        const SizedBox(width: 12),
                        _buildInfoBadge(
                          Icons.local_shipping_outlined,
                          product.shippingInformation,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Add to Cart Button
                    ElevatedButton(
                      onPressed: () {
                        controller.addToCart(product, quantity.value);
                        Get.snackbar(
                          "Success",
                          "${product.title} added to cart!",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.black87,
                          colorText: Colors.white,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff231F20),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(text: "Add to Cart | "),
                                TextSpan(
                                  text: "\$${product.price.toStringAsFixed(2)}",
                                ),
                                TextSpan(
                                  text:
                                      "  \$${originalPrice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.black87),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
