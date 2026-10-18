import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f10s_shopping/module/home/home_logic.dart';

import 'home_product_model.dart';


class HomeProductDetails extends GetView<HomeLogic> {

  const HomeProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final ProductModel product = Get.arguments;


    RxString selectedSize = 'L'.obs;
    RxInt selectedColorIndex = 0.obs;
    RxInt quantity = 1.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          product.imagePath,
                        ),
                        fit: BoxFit.cover,
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
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 26,
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
                    const SizedBox(height: 8),


                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          product.rating,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "(${product.reviewsCount})",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),


                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(text: product.description),
                          const TextSpan(
                            text: " Read More...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Choose Size",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: ['S', 'M', 'L', 'XL'].map((size) {
                                return Obx(() {
                                  bool isSelected = selectedSize.value == size;
                                  return GestureDetector(
                                    onTap: () => selectedSize.value = size,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                          ],
                        ),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Color",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children:
                                  [
                                    Colors.grey,
                                    Colors.brown.shade700,
                                    Colors.black,
                                  ].asMap().entries.map((entry) {
                                    int idx = entry.key;
                                    Color color = entry.value;
                                    return Obx(() {
                                      bool isSelected =
                                          selectedColorIndex.value == idx;
                                      return GestureDetector(
                                        onTap: () =>
                                            selectedColorIndex.value = idx,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelected
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: color,
                                          ),
                                        ),
                                      );
                                    });
                                  }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

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
                                TextSpan(text: product.price),
                                TextSpan(
                                  text: "  ${product.originalPrice}",
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
}
