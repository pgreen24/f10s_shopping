import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f10s_shopping/module/home/home_logic.dart';

import 'oder_complete.dart';

class HomeCheckout extends StatelessWidget {
  const HomeCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLogic logic = Get.find<HomeLogic>();

    return Material(
      color: const Color(0xFFF9F9F9),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRoundButton(
                    Icons.arrow_back_ios_new,
                    iconSize: 16,
                    onTap: () => Get.back(),
                  ),
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _buildRoundButton(Icons.linear_scale, onTap: () {}),
                ],
              ),
              const SizedBox(height: 30),

              Expanded(
                child: Obx(() {
                  if (logic.cartItems.isEmpty) {
                    return const Center(
                      child: Text(
                        "Your cart is empty!",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  }
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: logic.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = logic.cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Obx(
                              () => _buildCartItem(
                                imageUrl: 'https://unsplash.com',
                                title: cartItem['title'] ?? '',
                                subtitle: cartItem['subtitle'] ?? '',
                                price:
                                    '\$${(cartItem['price'] as double).toStringAsFixed(2)}',
                                quantity: cartItem['quantity'].value,
                                onDecrease: () {
                                  if (cartItem['quantity'].value > 1) {
                                    cartItem['quantity'].value--;
                                  }
                                },
                                onIncrease: () {
                                  cartItem['quantity'].value++;
                                },
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        'Shipping Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentCard(),
                      const SizedBox(height: 32),


                      Builder(
                        builder: (context) {
                          double subtotal = 0;
                          for (var item in logic.cartItems) {
                            subtotal +=
                                (item['price'] as double) *
                                (item['quantity'].value as int);
                          }

                          return Column(
                            children: [
                              _buildPriceRow(
                                'Total (${logic.cartItems.length} items)',
                                '\$${subtotal.toStringAsFixed(2)}',
                              ),
                              const SizedBox(height: 12),
                               _buildPriceRow('Shipping Fee', '\$0.00'),
                              const SizedBox(height: 12),
                              _buildPriceRow(
                                'Discount',
                                '-\$${logic.discount.toStringAsFixed(2)}',
                              ),
                              const Divider(
                                height: 40,
                                color: Color(0xFFEEEEEE),
                                thickness: 1,
                              ),
                              _buildPriceRow(
                                'Sub Total',
                                '\$${logic.totalPrice.toStringAsFixed(2)}',
                                isBold: true,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                }),
              ),

              GestureDetector(
                onTap: () {

                  Get.to(() => const OderComplete());
                },
                child: Container(
                  width: double.infinity,
                  height: 64,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF222021),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Center(
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundButton(
    IconData icon, {
    double iconSize = 20,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFEBEBEB), width: 1.5),
          color: Colors.white,
        ),
        child: Icon(icon, color: Colors.black, size: iconSize),
      ),
    );
  }

  Widget _buildCartItem({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
    required int quantity,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 100,
              color: Colors.grey.shade200,
              child: const Icon(Icons.image, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.more_horiz, color: Colors.black),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      _buildQuantityButton(Icons.remove, onTap: onDecrease),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildQuantityButton(Icons.add, onTap: onIncrease),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFEBEBEB)),
          color: Colors.white,
        ),
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1A4593),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'VISA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              '**** **** **** 2143',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ],
      ),
    );
  }

  static Widget _buildPriceRow(
    String label,
    String val, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color: isBold ? Colors.black : const Color(0xFF666666),
          ),
        ),
        Text(
          val,
          style: TextStyle(
            fontSize: isBold ? 18 : 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
